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
import Qt.labs.presentation 1.0

Slide {
    id: loadingSlide

    SlideText {
        id: mainText
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Flatpak and KDE"
    }

    SlideText {
        id: nameText
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 150
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Jan Grulich"
    }

    Image {
        id: flatpakLogo
        anchors {
            bottom: nameText.top
            top: mainText.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: 200
        source: "qrc:/images/flatpak.png"
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: kdeLogo
        anchors {
            bottom: nameText.top
            top: mainText.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: 200
        scale: 0.1
        opacity: 0
        source: "qrc:/images/kde.png"
        antialiasing: true
        fillMode: Image.PreserveAspectFit
    }

    ParallelAnimation {
        running: deck.currentSlide === 0
        loops: Animation.Infinite

        SequentialAnimation {
            NumberAnimation {
                target: kdeLogo
                property: "opacity"
                to: 1
                duration: 2000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: kdeLogo
                property: "opacity"
                to: 0.1
                duration: 2000
                easing.type: Easing.InOutQuad
            }
        }

        SequentialAnimation {
            NumberAnimation {
                target: kdeLogo
                property: "scale"
                to: 1
                duration: 2000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: kdeLogo
                property: "scale"
                to: 0.1
                duration: 2000
                easing.type: Easing.InOutQuad
            }
        }
    }

    ParallelAnimation {
        running: deck.currentSlide === 0
        loops: Animation.Infinite

        SequentialAnimation {
            NumberAnimation {
                target: flatpakLogo
                property: "opacity"
                to: 0
                duration: 2000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: flatpakLogo
                property: "opacity"
                to: 1
                duration: 2000
                easing.type: Easing.InOutQuad
            }
        }

        SequentialAnimation {
            NumberAnimation {
                target: flatpakLogo
                property: "scale"
                to: 0.1
                duration: 2000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: flatpakLogo
                property: "scale"
                to: 1
                duration: 2000
                easing.type: Easing.InOutQuad
            }
        }
    }
}
