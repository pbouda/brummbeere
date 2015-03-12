#include <QFileInfo>

#include "filemodel.h"

File::File(const QString &path, const QString &type)
    : mType(type), mPath(path)
{
    qDebug() << type;
    QFileInfo fileInfo(path);
    mName = fileInfo.fileName();
    if (mName.isEmpty() && path.endsWith("/")) {
        QStringList pathParts = path.split("/");
        if (pathParts.length() > 1)
            mName = pathParts[pathParts.length()-2];
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

void FileModel::initDav(QString davUrl, QString davUser, QString davPassword)
{
    QString strDavUrl = davUrl;
    if (!strDavUrl.endsWith("/"))
        strDavUrl += "/";
    strDavUrl = strDavUrl + "remote.php/webdav";
    // parse Url to get parts
    QUrl qtUrl(strDavUrl);
    mDavClient = new QWebDAV();

    connect(mDavClient, SIGNAL(directoryListingReady(QList<QWebDAV::FileInfo>)),
        this, SLOT(addDavFiles(QList<QWebDAV::FileInfo>)));

    mDavClient->initialize(strDavUrl, davUser, davPassword, qtUrl.path());
}

void FileModel::loadFromDir(QString davDir)
{
    mDavClient->list(davDir);
}

void FileModel::addFile(const File &file)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    mFiles << file;
    endInsertRows();
}

int FileModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return mFiles.count();
}

QVariant FileModel::data(const QModelIndex & index, int role) const
{
    if (index.row() < 0 || index.row() >= mFiles.count())
        return QVariant();

    const File &file = mFiles[index.row()];
    if (role == NameRole)
        return file.name();
    else if (role == TypeRole)
        return file.type();
    return QVariant();
}

QHash<int, QByteArray> FileModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[TypeRole] = "type";
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

/************** SLOTS *****************/

void FileModel::addDavFiles(QList<QWebDAV::FileInfo> fileInfo)
{
    for (int i = 0; i < fileInfo.size(); i++ ) {
        if (fileInfo[i].type == "directory" || fileInfo[i].type == "audio/mpeg")
            addFile(File(fileInfo[i].fileName, fileInfo[i].type));
    }
}

void FileModel::loadFolder(int fileIndex) {
    File fileToLoad = mFiles[fileIndex];
    if (fileToLoad.type() != "directory")
        return;

    // Clear current files
    beginRemoveRows(QModelIndex(), 0, mFiles.length()-1);
    mFiles.clear();
    endRemoveRows();

    loadFromDir(fileToLoad.path());
}
