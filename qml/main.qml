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

import QtQuick 2.6
import QtQml 2.2
import QtQuick.Controls 1.4
import Qt.labs.presentation 1.0

Presentation {
    id: deck

    // TODO change resolution
//     width: 1920
//     height: 1080

    // Alternative resolution
    width: 1280
    height: 800

    property double resolutionScale: width == 1024 ? 1 : 2
    property alias loadingSlide: loadingSlide

    fontFamily: "Cantarell"

    Image {
        id: bgImage

        anchors {
           fill: parent
        }

        source: "qrc:/images/guadec-main.png"
        antialiasing: true
        fillMode: Image.Stretch

        Text {
            anchors {
                bottom: parent.bottom
                bottomMargin: 10
                left: parent.left
                leftMargin: 15
            }
            color: "#5683cd"
            font.pointSize: 16
            text: "Flatpak and KDE"
        }

        Text {
            anchors {
                bottom: parent.bottom
                bottomMargin: 10
                right: parent.right
                rightMargin: 15
            }
            color: "#5683cd"
            font.pointSize: 16
            text: "Jan Grulich"
        }
    }

    LoadingSlide {
        id: loadingSlide
    }
}
