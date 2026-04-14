//
//  EquilibriumWidgetLiveActivity.swift
//  EquilibriumWidget
//
//  Created by Vladimir Martemianov on 14. 4. 2026..
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EquilibriumWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct EquilibriumWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: EquilibriumWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension EquilibriumWidgetAttributes {
    fileprivate static var preview: EquilibriumWidgetAttributes {
        EquilibriumWidgetAttributes(name: "World")
    }
}

extension EquilibriumWidgetAttributes.ContentState {
    fileprivate static var smiley: EquilibriumWidgetAttributes.ContentState {
        EquilibriumWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: EquilibriumWidgetAttributes.ContentState {
         EquilibriumWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: EquilibriumWidgetAttributes.preview) {
   EquilibriumWidgetLiveActivity()
} contentStates: {
    EquilibriumWidgetAttributes.ContentState.smiley
    EquilibriumWidgetAttributes.ContentState.starEyes
}
