#ifndef LIRC_H
#define LIRC_H


#include <QObject>
#include <QString>
#include <QDebug>
#include <QProcess>

class LircSingleton : public QObject
{
    Q_OBJECT
private:
    QString m_program;
    QStringList m_args;
    QProcess m_process ;
    QString m_vendorName;
    static LircSingleton * m_instance;
public:
    ~LircSingleton();
    static LircSingleton* Instance();

    QString vendorName()
    {
        return m_vendorName;
    }
protected:
    explicit LircSingleton(QObject *parent = nullptr);
signals:
    void sendedOnce();
    void sendStarted();
    void sendStopped();
    //void sendSuccess();
public slots:
    void setVendorName(QString name)
    {
        m_vendorName = name;
    }
    void startProcess();
    //void stopProcess();
    void startSend(QString key , QString device);
    void startSend(QString key);
    void stopSend(QString key, QString device);
    void stopSend(QString key);
    void sendCommand(QString key, QString device);
    void sendCommand(QString key);
    void errorHandle();
};

#endif // LIRC_H
