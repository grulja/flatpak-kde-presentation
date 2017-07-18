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

import QtQuick 2.0
import Qt.labs.presentation 1.0

Presentation {
    id: deck

    property bool inTransition: false;
    property int transitionTime: 500;
    property variant fromSlide;
    property variant toSlide;

    SequentialAnimation {
        id: forwardTransition

        PropertyAction {
            target: deck
            property: "inTransition"
            value: true
        }
        PropertyAction {
            target: toSlide
            property: "visible"
            value: true
        }
        ParallelAnimation {
            NumberAnimation {
                target: fromSlide
                property: "opacity"
                from: 1
                to: 0
                duration: deck.transitionTime
                easing.type: Easing.OutQuart
            }
            NumberAnimation {
                target: fromSlide
                property: "scale"
                from: 1; to: 3
                duration: deck.transitionTime
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: toSlide
                property: "opacity"
                from: 0; to: 1
                duration: deck.transitionTime
                easing.type: Easing.InQuart
            }
            NumberAnimation {
                target: toSlide
                property: "scale"
                from: 0.3
                to: 1
                duration: deck.transitionTime
                easing.type: Easing.InOutQuart
            }
        }
        PropertyAction {
            target: fromSlide
            property: "visible"
            value: false
        }
        PropertyAction {
            target: fromSlide
            property: "scale"
            value: 1
        }
        PropertyAction {
            target: deck
            property: "inTransition"
            value: false
        }
    }
    SequentialAnimation {
        id: backwardTransition
        running: false

        PropertyAction {
            target: deck
            property: "inTransition"
            value: true
        }
        PropertyAction {
            target: toSlide
            property: "visible"
            value: true
        }
        ParallelAnimation {
            NumberAnimation {
                target: fromSlide
                property: "opacity"
                from: 1
                to: 0
                duration: deck.transitionTime
                easing.type: Easing.OutQuart
            }
            NumberAnimation {
                target: fromSlide
                property: "scale"
                from: 1
                to: 0.7
                duration: deck.transitionTime
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: toSlide
                property: "opacity"
                from: 0
                to: 1
                duration: deck.transitionTime
                easing.type: Easing.InQuart
            }
            NumberAnimation { target: toSlide;
                property: "scale"
                from: 1.1
                to: 1
                duration: deck.transitionTime
                easing.type: Easing.InOutQuart
            }
        }
        PropertyAction {
            target: fromSlide
            property: "visible"
            value: false
        }
        PropertyAction {
            target: fromSlide
            property: "scale"
            value: 1
        }
        PropertyAction {
            target: deck
            property: "inTransition"
            value: false
        }
    }

    function switchSlides(from, to, forward)
    {
        if (deck.inTransition) {
            return false
        }

        deck.fromSlide = from
        deck.toSlide = to

        if (forward) {
            forwardTransition.running = true
        } else {
            backwardTransition.running = true
        }

        return true
    }

}
