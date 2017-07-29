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
import QtQuick.Dialogs 1.0
import Qt.labs.presentation 1.0

AnimatedPresentation {
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

    TextSlide {
        id: runtimeSlide

        SlideText {
            id: runtimeHeadline
            slide: runtimeSlide
            text: "KDE runtime"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 15
            }
        }

        Column {
            anchors {
                left: parent.left
                leftMargin: 10
                top: runtimeHeadline.bottom
                topMargin: 15
            }

            SlideText {
                slide: runtimeSlide
                scale: 0.08
                text: "• stable version"
            }

            SlideText {
                slide: runtimeSlide
                scale: 0.08
                text: "• flathub"
            }

            SlideText {
                slide: runtimeSlide
                scale: 0.08
                text: "• extensions"
            }
        }
    }

    TextSlide {
        id: extensionsSlide

        SlideText {
            id: extensionsHeadline
            slide: extensionsSlide
            text: "KDE runtime extensions"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 15
            }
        }

        Column {
            anchors {
                left: parent.left
                leftMargin: 10
                top: extensionsHeadline.bottom
                topMargin: 15
            }

            SlideText {
                slide: extensionsSlide
                scale: 0.08
                text: "• org.freedesktop.Platform.Icontheme"
            }

            SlideText {
                slide: extensionsSlide
                scale: 0.08
                text: "• org.kde.KStyle"
            }

            SlideText {
                slide: extensionsSlide
                scale: 0.08
                text: "• org.kde.PlatformTheme"
            }
        }
    }

    TextSlide {
        id: appsSlide

        SlideText {
            id: appsHeadline
            slide: appsSlide
            text: "KDE applications"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 15
            }
        }

        Column {
            anchors {
                left: parent.left
                leftMargin: 10
                top: appsHeadline.bottom
                topMargin: 15
            }

            SlideText {
                slide: appsSlide
                scale: 0.08
                text: "• Krita"
            }

            SlideText {
                slide: appsSlide
                scale: 0.08
                text: "• Dolphin"
            }

            SlideText {
                slide: appsSlide
                scale: 0.08
                text: "• Marble"
            }

            SlideText {
                slide: appsSlide
                scale: 0.08
                text: "• KDevelop"
            }

            SlideText {
                slide: appsSlide
                scale: 0.08
                text: "• Okular"
            }

            SlideText {
                slide: appsSlide
                scale: 0.08
                text: "• Many others"
            }
        }
    }

    TextSlide {
        id: portalsSlide

        SlideText {
            id: portalsHeadline
            slide: portalsSlide
            text: "Portals"
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }
    }

    TextSlide {
        id: portalsBackendSlide

        SlideText {
            id: portalsBackendHeadline
            slide: portalsBackendSlide
            text: "Backend implementation"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 15
            }
        }

        Column {
            anchors {
                left: parent.left
                leftMargin: 10
                top: portalsBackendHeadline.bottom
                topMargin: 15
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.08
                text: "• Released with Plasma 5.10"
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.08
                text: "• Supports following portals: "
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.06
                text: "    • Access"
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.06
                text: "    • AppChooser"
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.06
                text: "    • Email"
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.06
                text: "    • FileChooser"
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.06
                text: "    • Inhibit"
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.06
                text: "    • Notification"
            }

            SlideText {
                slide: portalsBackendSlide
                scale: 0.06
                text: "    • Print"
            }
        }
    }

    TextSlide {
        id: portalsFrameworksSlide

        SlideText {
            id: portalsFrameworksHeadline
            slide: portalsFrameworksSlide
            text: "Support in Qt and KF5"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 15
            }
        }

        Column {
            anchors {
                left: parent.left
                leftMargin: 10
                top: portalsFrameworksHeadline.bottom
                topMargin: 15
            }

            SlideText {
                slide: portalsFrameworksSlide
                scale: 0.08
                text: "• Qt"
            }

            SlideText {
                slide: portalsFrameworksSlide
                scale: 0.07
                text: "    • Flatpak platform plugin"
            }

            SlideText {
                slide: portalsFrameworksSlide
                scale: 0.08
                text: "• KDE Frameworks 5"
            }

            SlideText {
                slide: portalsFrameworksSlide
                scale: 0.07
                text: "    • KNotifications"
            }
        }
    }

    TextSlide {
        id: discoverSlide

        SlideText {
            id: discoverHeadline
            slide: discoverSlide
            text: "Plasma Discover"
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }
    }

    TextSlide {
        id: kdevelopSlide

        SlideText {
            id: kdevelopHeadline
            slide: kdevelopSlide
            text: "KDevelop support"
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }
    }

    TextSlide {
        id: lastSlide

        SlideText {
            id: lastHeadline
            slide: lastSlide
            text: "Thank you"
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }
    }
}
