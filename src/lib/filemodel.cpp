#include <QFileInfo>
#include <QSettings>

#include "filemodel.h"

File::File(const QString &path, const QString &type, const QString &name)
    : mType(type), mPath(path)
{
    if (name.isEmpty()) {
        QFileInfo fileInfo(path);
        mName = fileInfo.fileName();
        if (mName.isEmpty() && path.endsWith("/")) {
            QStringList pathParts = path.split("/");
            if (pathParts.length() > 1)
                mName = pathParts[pathParts.length()-2];
        }
    } else {
        mName = name;
    }
}

QString File::type() const
{
    return mType;
}

QString File::name() const
{
    return mName;
}

QString File::path() const
{
    return mPath;
}

/************************** FileModel **************************/

FileModel::FileModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void FileModel::addFile(const File &file)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    mFiles << file;
    endInsertRows();
}

int FileModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return mFiles.count();
}

QVariant FileModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= mFiles.count())
        return QVariant();

    const File &file = mFiles[index.row()];
    if (role == NameRole)
        return file.name();
    else if (role == TypeRole)
        return file.type();
    else if (role == PathRole)
        return file.path();
    return QVariant();
}

QVariantMap FileModel::get(int idx) const {
    QVariantMap map;
    foreach(int k, roleNames().keys()) {
        map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}

QHash<int, QByteArray> FileModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[TypeRole] = "type";
    roles[PathRole] = "path";
    return roles;
}

bool FileModel::hasAudio()
{
    for (int i=0; i < mFiles.length(); i++) {
        if (mFiles[i].type() == "audio/mpeg")
            return true;
    }
    return false;
}

QStringList FileModel::playlist()
{
    QStringList result;
    for (int i=0; i < mFiles.length(); i++) {
        if (mFiles[i].type() == "audio/mpeg") {
            result.append(mAuthUrl + mFiles[i].path());
        }
    }
    return result;
}

QStringList FileModel::davSettings()
{
    QStringList result;
    QSettings settings("peterbouda.eu", "TwoMusic");
    result.append(settings.value("url").toString());
    result.append(settings.value("user").toString());
    result.append(settings.value("password").toString());
    return result;
}

/************** SLOTS *****************/

void FileModel::initDav(const QString &davUrl,
                        const QString &davUser,
                        const QString &davPassword)
{
    mDavUrl = davUrl;
    if (!mDavUrl.endsWith("/"))
        mDavUrl += "/";
    mDavUrl = mDavUrl + "remote.php/webdav";
    mAuthUrl = mDavUrl;
    if (mAuthUrl.startsWith("http://"))
        mAuthUrl = mAuthUrl.replace("http://", "http://" + davUser + ":" + davPassword + "@");
    else if (mAuthUrl.startsWith("https://"))
        mAuthUrl = mAuthUrl.replace("https://", "https://" + davUser + ":" + davPassword + "@");
    // parse Url to get parts
    QUrl qtUrl(mDavUrl);
    mDavClient = new QWebDAV();

    connect(mDavClient, SIGNAL(directoryListingReady(QList<QWebDAV::FileInfo>)),
        this, SLOT(addDavFiles(QList<QWebDAV::FileInfo>)));

    mDavClient->initialize(mDavUrl, davUser, davPassword, qtUrl.path());

    emit davSettingsChanged();
}

void FileModel::loadFromDir(const QString &davDir)
{
    // Clear current files
    if (mFiles.length() > 0) {
        beginRemoveRows(QModelIndex(), 0, mFiles.length()-1);
        mFiles.clear();
        endRemoveRows();
    }

    QStringList parts = davDir.split("/");
    if (parts.length() > 2) {
        parts.removeAt(parts.size()-2);
        QString parentPath = parts.join("/");
        addFile(File(parentPath, "directory", ".."));
    }

    mDavClient->list(davDir);
}

void FileModel::addDavFiles(const QList<QWebDAV::FileInfo> &fileInfo)
{
    for (int i = 0; i < fileInfo.size(); i++ ) {
        if (fileInfo[i].type == "directory" || fileInfo[i].type == "audio/mpeg")
            addFile(File(fileInfo[i].fileName, fileInfo[i].type));
    }
    emit hasAudioChanged();
}

void FileModel::loadFolder(int fileIndex) {
    File fileToLoad = mFiles[fileIndex];
    if (fileToLoad.type() != "directory")
        return;

    loadFromDir(fileToLoad.path());
}
