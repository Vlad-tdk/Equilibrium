//
//  L10n.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import Foundation
import SwiftUI

enum L10n {
    enum Home {
        static let homeHeader = LocalizedStringKey("home.header")
        static let findInnerPeace = LocalizedStringKey("home.find_inner_peace")
        static let playMusic = LocalizedStringKey("home.play_music")
        static let pauseMusic = LocalizedStringKey("home.pause_music")
    }
    enum ModeMeditation{
        enum Title {
            static let breath: LocalizedStringKey = "mode.title.breath"
            static let mandala: LocalizedStringKey = "mode.title.mandala"
            static let images: LocalizedStringKey = "mode.title.images"
            static let fire: LocalizedStringKey = "mode.title.fire"
            static let antiStress: LocalizedStringKey = "mode.title.antistress"
            static let about: LocalizedStringKey = "mode.title.about"
        }
        enum Subtitle {
            static let breath: LocalizedStringKey = "mode.subtitle.breath"
            static let mandala: LocalizedStringKey = "mode.subtitle.mandala"
            static let images: LocalizedStringKey = "mode.subtitle.images"
            static let fire: LocalizedStringKey = "mode.subtitle.fire"
            static let antiStress: LocalizedStringKey = "mode.subtitle.antistress"
            static let about: LocalizedStringKey = "mode.subtitle.about"
        }
    }
    enum Mandala{
        static var alertMandalaTitle: LocalizedStringKey = "alert.mandala.title"
        static var alertMandalaMessage: LocalizedStringKey = "alert.mandala.message"
        
        static var mandalaTitle: LocalizedStringKey = "mandala.title"
        
    }
    
    enum Common{
        static var tapToMeditate: LocalizedStringKey = "common.tap_to_meditate"
        static var tapToExit: LocalizedStringKey = "common.tap_to_exit"
        static var gotIt: LocalizedStringKey = "common.got_it"
        static var done: LocalizedStringKey = "common.done"
        static var close: LocalizedStringKey = "common.cancel"
        static var reset: LocalizedStringKey = "common.reset"
        
    }
    enum Fire{
        static var alertFireTitle: LocalizedStringKey = "alert.fire.title"
        static var alertFireMessage: LocalizedStringKey = "alert.fire.message"
        static var fireTitle: LocalizedStringKey = "fire.title"
        static var fireChoose: LocalizedStringKey = "fire.choose_you_flame"
    }
    enum AboutView{
        static var versionNumber: LocalizedStringKey = "about.version_number"
        static var features: LocalizedStringKey = "about.features"
        static var about: LocalizedStringKey = "about.about"
        static var aboutText: LocalizedStringKey = "about.about_text"
        static var howToUse: LocalizedStringKey = "about.how_to_use"
        static var howToUseText: LocalizedStringKey = "about.how_to_use_text"
    }
    enum AntiStressView{
        static var title: LocalizedStringKey = "anti_stress.title"
        static var physicsControls: LocalizedStringKey = "anti_stress.physics_controls"
        static var resetToDefaults: LocalizedStringKey = "anti_stress.reset_to_defaults"
        static var vsSectionHeaderTitle: LocalizedStringResource = "anti_stress.vs_section_header_title"
        static var vsEnchasedParticleSize: LocalizedStringResource = "anti_stress.vs_enchased_particle_size"
        static var vsEnchasedUnitPt: LocalizedStringResource = "anti_stress.vs_enchased_unit_pt"
        static var vsEnchasedSpacing: LocalizedStringResource = "anti_stress.vs_enchased_spacing"
        static var fsSectionHeaderTitle: LocalizedStringResource = "anti_stress.fs_section_header_title"
        static var fsEnchasedInteractionRadius: LocalizedStringResource = "anti_stress.fs_enchased_interaction_radius"
        static var fsEnchasedUnitPt: LocalizedStringResource = "anti_stress.fs_enchased_unit_pt"
        static var fsEnchasedForceStrength: LocalizedStringResource = "anti_stress.fs_enchased_force_strength"
        static var fsEnchasedUnitN: LocalizedStringResource = "anti_stress.fs_enchased_unit_n"
        static var fsEnchasedForceSmoothness: LocalizedStringResource = "anti_stress.fs_enchased_force_smoothness"
        
        static var psSectionHeaderTitle: LocalizedStringResource = "anti_stress.ps_section_header_title"
        
        static var psEnchasedVelocityFactor: LocalizedStringResource = "anti_stress.ps_enchased_velocity_factor"
        static var psEnchasedUnitX: LocalizedStringResource = "anti_stress.ps_enchased_unit_x"
        
        static var psEnchasedFriction: LocalizedStringResource = "anti_stress.ps_enchased_friction"
        static var psEnchasedSpringStrength: LocalizedStringResource = "anti_stress.ps_enchased_spring_strength"
        static var psEnchasedUnitK: LocalizedStringResource = "anti_stress.ps_enchased_unit_k"
        static var presetsSectionSectionHeaderTitle: LocalizedStringResource = "anti_stress.presets.section_header_title"
        static var presetButtonTitleGentle: LocalizedStringResource = "anti_stress.presets.button_title_gentle"
        static var presetButtonTitleDynamic: LocalizedStringResource = "anti_stress.presets.button_title_dynamic"
        static var presetButtonTitleFluid: LocalizedStringResource = "anti_stress.presets.button_title_fluid"
        static var presetButtonTitleBouncy: LocalizedStringResource = "anti_stress.presets.button_title_bouncy"
    }
    enum BreathSettingsView{
        static var breathTitle: LocalizedStringKey = "breath_settings.breathTitle"
        static var resetToDefaultsAsk: LocalizedStringKey = "breath_settings.resetToDefaults?"
        static var resetToDefaults: LocalizedStringKey = "breath_settings.resetToDefaults"
        static var alertResetMessage: LocalizedStringKey = "breath_settings.alert.reset_to_defaults.message"
        static var preview: LocalizedStringKey = "breath_settings.preview"
        static var breathTiming: LocalizedStringKey = "breath_settings.breathTiming"
        static var sliderInhale: LocalizedStringResource = "breath_settings.slider.inhale"
        static var sliderHold: LocalizedStringResource = "breath_settings.slider.hold"
        static var sliderExhale: LocalizedStringResource = "breath_settings.slider.exhale"
        static var sliderUnit: LocalizedStringResource = "breath_settings.slider.unit"
        static var sessionTitle: LocalizedStringKey = "breath_settings.sessionTitle"
        static var sessionSliderTitle: LocalizedStringResource = "breath_settings.sessionSliderTitle"
        static var sessionSliderUnit: LocalizedStringResource = "breath_settings.sessionSliderUnit"
        static var colorPickerTitleBackground: LocalizedStringResource = "breath_settings.colorPickerTitleBackground"
        static var colorPickerTitleCircle: LocalizedStringResource = "breath_settings.colorPickerTitleCircle"
        static var colorSectionTitle: LocalizedStringKey = "breath_settings.colorSectionTitle"
        static var circleSectionTitle: LocalizedStringKey = "breath_settings.circleSectionTitle"
        static var circleSliderTitle: LocalizedStringResource = "breath_settings.circleSliderTitle"
        static var circleSliderUnit: LocalizedStringResource = "breath.circleSliderUnit"
        static func totalSession(minutes: Int, seconds: Int) -> String {
            let format = NSLocalizedString("breath.total_session", comment: "")
            return String.localizedStringWithFormat(format, minutes, seconds)
        }
        static func totalCicles(_ cicles: Int) -> String {
            let format = NSLocalizedString("breath.total_cicles", comment: "")
            return String.localizedStringWithFormat(format, cicles)
        }
    }
    
    enum BreathView{
        static var textTitle: LocalizedStringKey = "breath.text.title"
        static var textSubTitle: LocalizedStringKey = "breath.text.subTitle"
        static var of: LocalizedStringKey = "breath.of"
        static var hold: LocalizedStringResource = "breath.hold"
        static var exhale: LocalizedStringResource = "breath.exhale"
        static var inhale: LocalizedStringResource = "breath.inhale"
        static var startButtonTitle: LocalizedStringKey = "breath.startButton.title"
        static var stopButtonTitle: LocalizedStringKey = "breath.stopButton.title"
        
        static func cycleProgress(_ current: Int, _ total: Int) -> String {
            let format = NSLocalizedString("breath.cycle_progress", comment: "")
            return String.localizedStringWithFormat(format, Int(current), Int(total))
        }
        static func settingBadgeTime(_ time: Double) -> String {
            let seconds = Int(time.rounded())
            return String.localizedStringWithFormat(
                NSLocalizedString("breath.time", comment: ""),
                seconds
            )
        }
        static func phaseTimeRemaining(_ seconds:Int) -> String {
            let seconds = Int(seconds)
            return String.localizedStringWithFormat(
                NSLocalizedString("breath.phase_time_remaining", comment: ""),
                seconds
            )
        }
    }
    enum CalmingImagesView{
        static var textTitle: LocalizedStringKey = "calming_images.text.title"
    }
    
    enum StatisticsView{
        static var textTitle: LocalizedStringKey = "statistics.text.title"
        static var labelSessions: LocalizedStringResource = "statistics.label.sessions"
        static var labelTotalTime: LocalizedStringResource = "statistics.label.total_time"
        static var labelDayStreak: LocalizedStringResource = "statistics.label.day_streak"
        static var labelFavorite: LocalizedStringResource = "statistics.label.favorite"
        static var streakTitle: LocalizedStringKey = "statistics.streak.title"
        static var currentTitle: LocalizedStringKey = "statistics.current.title"
        static var longestTitle: LocalizedStringKey = "statistics.longest.title"
        static var streakAmazing: LocalizedStringResource = "statistics.streak.amazing"
        static var streakKeepGoing: LocalizedStringResource = "statistics.streak.keep_going"
        static var streakOneWeek: LocalizedStringResource = "statistics.streak.one_week"
        static var streakBuildingMomtntum: LocalizedStringResource = "statistics.streak.building_momtntum"
        static var streakYoureAwesome: LocalizedStringResource = "statistics.streak.youre_on_a_roll"
        static var featuresTitle
        : LocalizedStringKey = "statistics.features.title"
        static var breathingTitle: LocalizedStringResource = "statistics.features.breathing.title"
        static func statsTotalBreathCycles(_ totalBreathCycles:Int) -> String {
            let totalBreathCycles = Int(totalBreathCycles)
            return String.localizedStringWithFormat(
                NSLocalizedString("statistics.totalBreathCycles", comment: ""),
                totalBreathCycles
            )
        }
        static var mandalaTitleSessions: LocalizedStringResource = "statistics.features.mandala.title.sessions"
        static func mandalaDetaledViewed(_ totalMandalasViewed:Int) -> String {
            let totalMandalasViewed = Int(totalMandalasViewed)
            return String.localizedStringWithFormat(
                NSLocalizedString("statistics.features.mandala.detaled", comment: ""),
                totalMandalasViewed
            )
        }
        
        static var calmingTitle: LocalizedStringResource = "statistics.features.calming.title"
        
        static func calmingDetaledViewed(_ calmingDetaledViewed:Int) -> String {
            let calmingDetaledViewed = Int(calmingDetaledViewed)
            return String.localizedStringWithFormat(
                NSLocalizedString("statistics.features.calming_detaled_viewed", comment: ""),
                calmingDetaledViewed
            )
        }
        
        static var fireTitle: LocalizedStringResource = "statistics.features.fire.title"
        
        static var antiStressTitle: LocalizedStringResource = "statistics.features.anti_stress.title"
        
        static func antiStressDetaled(_ antiStressDetaled:Int) -> String {
            let antiStressDetaled = Int(antiStressDetaled)
            return String.localizedStringWithFormat(
                NSLocalizedString("statistics.features.anti_tress_detaled", comment: ""),
                antiStressDetaled
            )
        }
        
        static var milestoneTitle: LocalizedStringKey = "statistics.features.milestone.title"
        
        static var milestoneTotalSessions: LocalizedStringResource = "statistics.features.milestone.total.sessions"
        static var milestoneTimeInvected: LocalizedStringResource = "statistics.features.milestone.time_invected"
        static var milestoneDaysActive: LocalizedStringResource = "statistics.features.milestone.days_active"
        static var milestoneBreathCicles: LocalizedStringResource = "statistics.features.milestone.breath_cicles"
        static var resetStats: LocalizedStringKey = "statistics.features.milestone.reset_stats"
        static var periodWeek: LocalizedStringKey = "statistics.features.milestone.period.week"
        static var periodMonth: LocalizedStringKey = "statistics.features.milestone.period.month"
        static var periodAllTime: LocalizedStringKey = "statistics.features.milestone.period.all_time"
    }
    enum OnboardingView{
        static var onboardingFirstTitle: LocalizedStringResource = "onboarding.first_title"
        static var onboardingFirstDescription: LocalizedStringResource = "onboarding.first_description"
        static var onboardingSecondTitle: LocalizedStringResource = "onboarding.second_title"
        static var onboardingSecondDescription: LocalizedStringResource = "onboarding.second_description"
        static var onboardingThirdTitle: LocalizedStringResource = "onboarding.third_title"
        static var onboardingThirdDescription: LocalizedStringResource = "onboarding.third_description"
        static var onboardingFourthTitle: LocalizedStringResource = "onboarding.fourth_title"
        static var onboardingFourthDescription: LocalizedStringResource = "onboarding.fourth_description"
        static var skipButtonTitle: LocalizedStringResource = "onboarding.skip"
        static var nextButtonTitle: LocalizedStringResource = "onboarding.next"
        static var startedButtonTitle: LocalizedStringResource = "onboarding.started"
    }
    
    enum PhysicsGuideView{
        static var title: LocalizedStringResource = "physics_guide.title"
        static var titleForceStrength: LocalizedStringResource = "physics_guide.title_force_strength"
        static var descriptionControlsHowStronglyParticlesReactToTouch: LocalizedStringResource = "physics_guide.description_controls_how_strongly_particles_react_to_touch"
        static var exampleLowGentleSubtleMovements: LocalizedStringResource = "physics_guide.example_low_gentle_subtle_movements"
        static var exampleMediumBalancedNaturaFeel: LocalizedStringResource = "physics_guide.example_medium_balanced_natura_feel"
        static var exampleHighStrongDramaticReactions: LocalizedStringResource = "physics_guide.example_high_strong_dramatic_reactions"
        static var titleInteractionRadius: LocalizedStringResource = "physics_guide.title_interaction_radius"
        static var descriptionTheDistanceAtWhichParticleStartReacting: LocalizedStringResource = "physics_guide.description_the_distance_at_which_particle_start_reacting"
        static var exampleSmallPreciselocalizedeffect: LocalizedStringResource = "physics_guide.example_small_preciselocalizedeffect"
        static var exampleMediumBalancedSpread: LocalizedStringResource = "physics_guide.example_medium_balanced_spread"
        static var exampleLargeWideFlowingMovements: LocalizedStringResource = "physics_guide.example_large_wide_flowing_movements"
        static var titleVelocityFactor: LocalizedStringResource = "physics_guide.title_velocity_factor"
        static var descriptionHowQuicklyParticlesMove: LocalizedStringResource = "physics_guide.description_how_quickly_particles_move"
        static var exampleSlowDreamyFloating: LocalizedStringResource = "physics_guide.example_slow_dreamy_floating"
        static var exampleNormalNaturalSpeed: LocalizedStringResource = "physics_guide.example_normal_natural_speed"
        static var exampleFastQuickEnergetic: LocalizedStringResource = "physics_guide.example_fast_quick_energetic"
        static var titleFriction: LocalizedStringResource = "physics_guide.title_friction"
        static var descriptionHowQuicklyParticlesSlowDown: LocalizedStringResource = "physics_guide.description_how_quickly_particles_slow_down"
        static var exampleLowSlidesFarFluid: LocalizedStringResource = "physics_guide.example_low_slides_far_fluid"
        static var exampleMediumBalancedDamping: LocalizedStringResource = "physics_guide.example_medium_balanced_damping"
        static var exampleHighStopsQuicklyStable: LocalizedStringResource = "physics_guide.example_high_stops_quickly_stable"
        static var titleSpringStrength: LocalizedStringResource = "physics_guide.title_spring_strength"
        static var descriptionHowStronglyParticlesReturnToOrigin: LocalizedStringResource = "physics_guide.description_how_strongly_particles_return_to_origin"
        static var exampleWeakSlowReturnDrifts: LocalizedStringResource = "physics_guide.example_weak_slow_return_drifts"
        static var exampleMediumBalancedRestoration: LocalizedStringResource = "physics_guide.example_medium_balanced_restoration"
        static var exampleStrongQuickSnapBack: LocalizedStringResource = "physics_guide.example_strong_quick_snap_back"
    }
    
    enum RatingPromptView{
        static var title: LocalizedStringResource = "rating_prompt.title"
        static var message: LocalizedStringResource = "rating_prompt.message"
        static var remindMeLaterButtonTitle: LocalizedStringResource = "rating_prompt.remind_me_later"
        static var rateOnAppStore: LocalizedStringResource = "rating_prompt.rate_on_app_store"
        static var buttonTitleSendFeedback: LocalizedStringResource = "rating_prompt.send_feedback"
        static var buttonTitleMaybeLater: LocalizedStringResource = "rating_prompt.maybe_later"
    }
}
