
#include <QGuiApplication>
#include <QUrl>
#include <QDir>
#include <QMetaObject>
#include <QCommandLineParser>
#include <QCommandLineOption>

#include <QQuickView>
#include <QQmlEngine>

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);

    QCommandLineParser parser;
    QCommandLineOption noFullscreenOption(QStringLiteral("no-fullscreen"));
    parser.addOption(noFullscreenOption);
    parser.process(app);

    QQuickView window(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (parser.isSet(noFullscreenOption)) {
        window.showNormal();
    } else {
        window.showFullScreen();
    }

    QQmlEngine *engine = window.engine();
    QObject::connect(engine, &QQmlEngine::quit, &app, &QGuiApplication::quit);

    return app.exec();
}

