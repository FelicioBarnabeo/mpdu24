#include "powersupply.h"
#include "QIODevice"
#include "QString"
#include "QStringList"
#include "QDebug"
#include "QTextStream"



PowerSupplySingleton * PowerSupplySingleton::m_instance = 0;

PowerSupplySingleton * PowerSupplySingleton::Instance(){
    try{
        if(m_instance == 0)
            m_instance = new PowerSupplySingleton;
        return m_instance;
    }
    catch(...){
        qDebug() << Q_FUNC_INFO << "Undefined exception";
    }
    return nullptr;
}


PowerSupplySingleton::PowerSupplySingleton(QObject *parent) : QObject(parent)
{
    try{
        m_idleTimer = new QTimer(this);
        connect(m_idleTimer,SIGNAL(timeout()),this,SLOT(suspendSystem()));
        m_idleTimer->start(20000);
        m_batterystatus.setFileName("/sys/class/power_supply/bq27621-0/uevent");
        if(!m_batterystatus.open(QIODevice::ReadOnly | QIODevice::Text))
            qDebug()<<"Failed to open file" << m_batterystatus.fileName();
        //connect(&usbCheckThread,&MyThread::chargeConnected,this,&PowerSupplySingleton::checkBatteryStatus);
        //usbCheckThread.start();
    }
    catch(...){
        qDebug() << Q_FUNC_INFO << "Undefined exception";
    }

}


PowerSupplySingleton::~PowerSupplySingleton()
{
    //qDebug()<<"PowerSupplySingleton destructor!!";
    //delete m_idleTimer;
    //m_batterystatus.close();
}

int PowerSupplySingleton::getChargingPercent(int mkVoltage){
    int mVolt = mkVoltage * 0.001;
    //qDebug()<<"mvolt = "<<mVolt;
    for(auto var: (m_charging ? chargingTable : dischargingTable))
        if(mVolt >= var.voltage){
            //qDebug()<<"Var.percent = "<<var.percent;
            return var.percent;
        }
    return 0;
}

void PowerSupplySingleton::checkBatteryStatus()
{   
    //qDebug()<<"Check battery status";
    m_batterystatus.seek(0);
    QTextStream in(&m_batterystatus);
    QStringList list;
    QString line = in.readLine();
    while(!line.isNull())
    {
        if(line.startsWith("POWER_SUPPLY_CURRENT_NOW"))
        {
            list = line.split("POWER_SUPPLY_CURRENT_NOW=");
            setCharging( list.back().toLong(nullptr,10) > 100000 );
        }

        if(line.startsWith("POWER_SUPPLY_VOLTAGE_NOW"))
        {
            QStringList list =  line.split("POWER_SUPPLY_VOLTAGE_NOW=");
            setCurrentVolt(getChargingPercent(list.back().toLong(nullptr,10)) * 0.01); /*0.01 - procent */
            setLowCharge( currentVolt() < 0.1 );
        }
        line = in.readLine();
    }

}
