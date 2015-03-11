#include "filemodel.h"

File::File(const QString &name, const QString &icon)
    : mName(name), mIcon(icon)
{
}

QString File::icon() const
{
    return mIcon;
}

QString File::name() const
{
    return mName;
}


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

int FileModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return mFiles.count();
}

QVariant FileModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= mFiles.count())
        return QVariant();

    const File &file = mFiles[index.row()];
    if (role == NameRole)
        return file.name();
    else if (role == IconRole)
        return file.icon();
    return QVariant();
}

QHash<int, QByteArray> FileModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[IconRole] = "icon";
    return roles;
}

void FileModel::addDavFiles(QList<QWebDAV::FileInfo> fileInfo)
{
    for (int i = 0; i < fileInfo.size(); i++ ) {
        QString icon = "file.png";
        if (fileInfo[i].type != "directory")
            icon = "directory.png";
        addFile(File(fileInfo[i].fileName, icon));
    }
}
