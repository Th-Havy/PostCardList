import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.0

import PostCard 1.0

Item {
    id: mainView

    property Utils utils: Utils {}
    property string title: ""
    property StackView stackView

    ListView {
        id: postCardListView
        model: postCardModel
        anchors.fill: parent
        spacing: 10
        anchors.topMargin: spacing
        delegate: PostCard {
            stackView: mainView.stackView
        }
    }

    RoundButton {
        id: newCardButton
        width: 80
        height: 80
        anchors.horizontalCenter: parent.right
        anchors.verticalCenter: parent.bottom
        anchors.horizontalCenterOffset: -width
        anchors.verticalCenterOffset: -height
        text: "<b>+<b>"
        font.pointSize: 18
        onClicked: imagePicker.setVisible(true)
    }

    DropImageArea {
        id: dropImageArea
    }

    ImagePicker {
        id: imagePicker
        onAccepted: {
            for (var image of imagePicker.fileUrls) {
                postCardModel.appendPostCard(image, "", 0)
            }
        }
    }
}
