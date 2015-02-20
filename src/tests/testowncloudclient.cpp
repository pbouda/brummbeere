#include <QtTest/QtTest>

class TestOwncloudClient: public QObject
{
    Q_OBJECT
private slots:
    void toUpper();
};

void TestOwncloudClient::toUpper()
{
    QString str = "Hello";
    QCOMPARE(str.toUpper(), QString("HELLO"));
}

QTEST_MAIN(TestOwncloudClient)
#include "testowncloudclient.moc"
