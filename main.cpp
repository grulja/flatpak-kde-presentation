/*
 * Copyright © 2017 Red Hat, Inc
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *       Jan Grulich <jgrulich@redhat.com>
 */

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

