TEMPLATE = app
TARGET = mpdu24
QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    myapplication.cpp \
    powersupply.cpp \
    lirc.cpp \
    keypressevent.cpp

RESOURCES += qml.qrc
#QMAKE_CXXFLAGS += -O2
# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH = "/home/mugen/Projects/build-MPDU_newGeneration-Desktop_Qt_5_10_0_GCC_64bit-Debug"

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#DEFINES +=  ARM
#DEFINES += X86 QT_DEPRECATED_WARNINGS

#contains(DEFINES, ARM)
#{
#}
#contains(DEFINES, X86)
#{
#    DEFINES +=
#}

HEADERS += \
    myapplication.h \
    powersupply.h \
    lirc.h \
    keypressevent.h

lupdate_only{
SOURCES = *.qml
}

DISTFILES += \
    DvdBluray.qml \
    KCS.qml \
    VKS.qml \
    Channels.qml
