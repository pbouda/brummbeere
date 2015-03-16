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
    Q_PROPERTY(bool hasAudio READ hasAudio NOTIFY hasAudioChanged)
    Q_PROPERTY(QStringList playlist READ playlist)

public:
    enum FileRoles {
        NameRole = Qt::UserRole + 1,
        TypeRole,
        PathRole
    };

    FileModel(QObject *parent = 0);

    void addFile(const File &file);
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    Q_INVOKABLE QVariantMap get(int idx) const;
    void initDav(const QString &davUrl, const QString &davUser, const QString &davPassword);
    void loadFromDir(const QString &davDir);
    bool hasAudio();
    QStringList playlist();

protected:
    QHash<int, QByteArray> roleNames() const;

signals:
    void hasAudioChanged();

private:
    QList<File> mFiles;
    QWebDAV* mDavClient;
    QString mDavUrl;
    QString mAuthUrl;

public slots:
    //void directoryListingError(QString url);
    void addDavFiles(const QList<QWebDAV::FileInfo> &fileInfo);
    void loadFolder(int);

};

#endif // FILEMODEL_H
