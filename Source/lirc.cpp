#include "lirc.h"
#include <QDebug>
#include <QGuiApplication>
#include <QFile>
#include <QTextStream>

LircSingleton * LircSingleton::m_instance = nullptr;
LircSingleton::LircSingleton(QObject *parent): QObject(parent), m_program("/usr/bin/irsend")
{
    m_args.clear();
    //m_args<< "SEND_ONCE" << "vista_mce" << "KEY_DOWN";
//        connect(&m_process,  static_cast<void(QProcess::*)(int, QProcess::ExitStatus)>(&QProcess::finished),
//                this,&LircSingleton::errorHandle);
    //connect(&m_process,static_cast<void(QProcess::*)(int, QProcess::ExitStatus)>(&QProcess::finished),this,&LircSingleton::sendSuccess);
}

LircSingleton::~LircSingleton(){}

void LircSingleton::errorHandle()
{
//    QFile file("log.txt");
//    if(!file.open(QIODevice::WriteOnly))
//    {
//        qDebug() << "Id = " << m_process.processId()<< " " << m_process.errorString();
//        qDebug()<<"Cant create file log.txt";
//        return;
//    }
//    QTextStream out(&file);
    qDebug() << "Id = " << m_process.processId()<< " " << m_process.errorString();
    //file.close();
}

LircSingleton *LircSingleton::Instance()
{
    if(m_instance==nullptr)
    {
        m_instance = new LircSingleton();
    }
    return m_instance;
}

void LircSingleton::startSend(QString key, QString device)
{
    m_args.clear();
    m_args << "SEND_START" << device << key;
    emit sendStarted();
    startProcess();
}

void LircSingleton::startSend(QString key)
{
    startSend(key, m_vendorName);
}

void LircSingleton::stopSend(QString key, QString device)
{
    m_args.clear();
    m_args << "SEND_STOP" << device << key;
    emit sendStopped();
    startProcess();
}

void LircSingleton::stopSend(QString key)
{
    stopSend(key, m_vendorName);
}

void LircSingleton::sendCommand(QString key,QString device )
{
    m_args.clear();
    m_args << "SEND_ONCE" << device << key;
    emit sendedOnce();
    startProcess();

}

void LircSingleton::sendCommand(QString key)
{
    sendCommand(key, m_vendorName);
}

void LircSingleton::startProcess()
{
    //m_process.
    //QGuiApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
    //qDebug()<< "send signal: "<< m_args;
    try{
        if(m_process.state() > 0){
            //qDebug()<<"Process kill";
            //m_process.waitForFinished(100);
            m_process.kill(); //throw QProcess::FailedToStart;
            m_process.waitForFinished(50);
        }
         m_process.start(m_program, m_args);
         m_process.waitForFinished(100);
    }
    catch(...){
        //qDebug() << Q_FUNC_INFO << "Undefined exception";
    }
    //connect(m_process,SIGNAL(finished),this,SLOT(stopProcess));
    //connect(m_process,&QProcess::finished,this,&LircSingleton::stopProcess);
}

//void LircSingleton::stopProcess()
//{
//    m_process->close();
//    delete m_process;
//    qDebug()<<"Stop process";
//}




