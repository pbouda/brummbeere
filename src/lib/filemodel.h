#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QAbstractListModel>
#include <QStringList>

#include "qwebdav.h"

class File
{
public:
    File(const QString &path, const QString &type);

    QString type() const;
    QString name() const;
    QString path() const;

private:
    QString mName;
    QString mType;
    QString mPath;
};

class FileModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(bool hasAudio READ hasAudio)
public:
    enum FileRoles {
        NameRole = Qt::UserRole + 1,
        TypeRole
    };

    FileModel(QObject *parent = 0);

    void addFile(const File &file);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    void initDav(QString davUrl, QString davUser, QString davPassword);
    void loadFromDir(QString davDir);
    bool hasAudio();

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<File> mFiles;
    QWebDAV* mDavClient;

public slots:
    //void directoryListingError(QString url);
    void addDavFiles(QList<QWebDAV::FileInfo> fileInfo);
    void loadFolder(int);

};

#endif // FILEMODEL_H
