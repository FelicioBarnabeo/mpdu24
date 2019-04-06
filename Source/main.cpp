#include "myapplication.h"
#include "powersupply.h"
#include <QQmlContext>
#include "lirc.h"
#include <QWindow>
#include <QScreen>
#include <QProcess>
#include <QString>

//#include <QThread>

int main(int argc, char *argv[])
{

//    QFile logFile("logfile.txt");
//    logFile.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Truncate);
//    QTextStream out(&logFile);
    QProcess reboot;
    try{
        qDebug() << "VERSION IL96-024 15.10.18";
        //qDebug()<<QThread::idealThreadCount();
        MyApplication app(argc, argv);
        LircSingleton *driver = LircSingleton::Instance();
        app.getEngine().rootContext()->setContextProperty("mainApp",&app);
        app.getEngine().rootContext()->setContextProperty("batteryClass",app.getBattery());
        app.getEngine().rootContext()->setContextProperty("driver",driver);
        app.getEngine().load(QUrl(QStringLiteral("qrc:/main.qml")));
        return app.exec();
    }

//    catch(std::exception &e)
//    {
//        out << Q_FUNC_INFO <<  "Exception [" << e.what() << "]. Terminated.";
//        qDebug() << Q_FUNC_INFO <<  "Exception [" << e.what() << "]. Terminated.";
//    }
    catch(...)
    {
        qDebug()<< Q_FUNC_INFO << "Undefined error . Terminated";
        QString program("/sbin/reboot");
        QStringList args;
        reboot.start(program,args,QIODevice::ReadWrite);
    }
    //logFile.close();
    //return 1;
}

