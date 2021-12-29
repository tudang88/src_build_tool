#include <QGuiApplication>
#include <QQuickView>
#include <QDebug>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;
    view.setSource(QUrl("qrc:/ui/MainLayer.qml"));
    // only show close and minimum button
    view.setFlags(Qt::WindowCloseButtonHint | Qt::WindowMinimizeButtonHint);
    //disable resize window
    view.setMinimumSize(0.75 * QSize(1440, 1024));
    view.setMaximumSize(0.75 * QSize(1440, 1024));
    qDebug()<< "Size: " << view.size();
    view.show();
    return app.exec();
}
