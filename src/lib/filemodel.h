#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QAbstractListModel>
#include <QStringList>

#include "qwebdav.h"

class File
{
public:
    File(const QString &name, const QString &icon);

    QString icon() const;
    QString name() const;

private:
    QString mName;
    QString mIcon;

};

class FileModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum FileRoles {
        NameRole = Qt::UserRole + 1,
        IconRole
    };

    FileModel(QObject *parent = 0);

    void addFile(const File &file);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<File> mFiles;

public slots:
    //void directoryListingError(QString url);
    void addDavFiles(QList<QWebDAV::FileInfo> fileInfo);

};

#endif // FILEMODEL_H
