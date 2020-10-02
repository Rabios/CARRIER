local ffi = require("ffi")
ffi.cdef([[
typedef enum SteamWorks_EUniverse {
	k_EUniverseInvalid = 0,
	k_EUniversePublic = 1,
	k_EUniverseBeta = 2,
	k_EUniverseInternal = 3,
	k_EUniverseDev = 4,
	k_EUniverseMax = 5
} SteamWorks_EUniverse;
typedef enum SteamWorks_EResult {
	k_EResultOK = 1,
	k_EResultFail = 2,
	k_EResultNoConnection = 3,
	k_EResultInvalidPassword = 5,
	k_EResultLoggedInElsewhere = 6,
	k_EResultInvalidProtocolVer = 7,
	k_EResultInvalidParam = 8,
	k_EResultFileNotFound = 9,
	k_EResultBusy = 10,
	k_EResultInvalidState = 11,
	k_EResultInvalidName = 12,
	k_EResultInvalidEmail = 13,
	k_EResultDuplicateName = 14,
	k_EResultAccessDenied = 15,
	k_EResultTimeout = 16,
	k_EResultBanned = 17,
	k_EResultAccountNotFound = 18,
	k_EResultInvalidSteamID = 19,
	k_EResultServiceUnavailable = 20,
	k_EResultNotLoggedOn = 21,
	k_EResultPending = 22,
	k_EResultEncryptionFailure = 23,
	k_EResultInsufficientPrivilege = 24,
	k_EResultLimitExceeded = 25,
	k_EResultRevoked = 26,
	k_EResultExpired = 27,
	k_EResultAlreadyRedeemed = 28,
	k_EResultDuplicateRequest = 29,
	k_EResultAlreadyOwned = 30,
	k_EResultIPNotFound = 31,
	k_EResultPersistFailed = 32,
	k_EResultLockingFailed = 33,
	k_EResultLogonSessionReplaced = 34,
	k_EResultConnectFailed = 35,
	k_EResultHandshakeFailed = 36,
	k_EResultIOFailure = 37,
	k_EResultRemoteDisconnect = 38,
	k_EResultShoppingCartNotFound = 39,
	k_EResultBlocked = 40,
	k_EResultIgnored = 41,
	k_EResultNoMatch = 42,
	k_EResultAccountDisabled = 43,
	k_EResultServiceReadOnly = 44,
	k_EResultAccountNotFeatured = 45,
	k_EResultAdministratorOK = 46,
	k_EResultContentVersion = 47,
	k_EResultTryAnotherCM = 48,
	k_EResultPasswordRequiredToKickSession = 49,
	k_EResultAlreadyLoggedInElsewhere = 50,
	k_EResultSuspended = 51,
	k_EResultCancelled = 52,
	k_EResultDataCorruption = 53,
	k_EResultDiskFull = 54,
	k_EResultRemoteCallFailed = 55,
	k_EResultPasswordUnset = 56,
	k_EResultExternalAccountUnlinked = 57,
	k_EResultPSNTicketInvalid = 58,
	k_EResultExternalAccountAlreadyLinked = 59,
	k_EResultRemoteFileConflict = 60,
	k_EResultIllegalPassword = 61,
	k_EResultSameAsPreviousValue = 62,
	k_EResultAccountLogonDenied = 63,
	k_EResultCannotUseOldPassword = 64,
	k_EResultInvalidLoginAuthCode = 65,
	k_EResultAccountLogonDeniedNoMail = 66,
	k_EResultHardwareNotCapableOfIPT = 67,
	k_EResultIPTInitError = 68,
	k_EResultParentalControlRestricted = 69,
	k_EResultFacebookQueryError = 70,
	k_EResultExpiredLoginAuthCode = 71,
	k_EResultIPLoginRestrictionFailed = 72,
	k_EResultAccountLockedDown = 73,
	k_EResultAccountLogonDeniedVerifiedEmailRequired = 74,
	k_EResultNoMatchingURL = 75,
	k_EResultBadResponse = 76,
	k_EResultRequirePasswordReEntry = 77,
	k_EResultValueOutOfRange = 78,
	k_EResultUnexpectedError = 79,
	k_EResultDisabled = 80,
	k_EResultInvalidCEGSubmission = 81,
	k_EResultRestrictedDevice = 82,
	k_EResultRegionLocked = 83,
	k_EResultRateLimitExceeded = 84,
	k_EResultAccountLoginDeniedNeedTwoFactor = 85,
	k_EResultItemDeleted = 86,
	k_EResultAccountLoginDeniedThrottle = 87,
	k_EResultTwoFactorCodeMismatch = 88,
	k_EResultTwoFactorActivationCodeMismatch = 89,
	k_EResultAccountAssociatedToMultiplePartners = 90,
	k_EResultNotModified = 91,
	k_EResultNoMobileDevice = 92,
	k_EResultTimeNotSynced = 93,
	k_EResultSmsCodeFailed = 94,
	k_EResultAccountLimitExceeded = 95,
	k_EResultAccountActivityLimitExceeded = 96,
	k_EResultPhoneActivityLimitExceeded = 97,
	k_EResultRefundToWallet = 98,
	k_EResultEmailSendFailure = 99,
	k_EResultNotSettled = 100,
	k_EResultNeedCaptcha = 101,
	k_EResultGSLTDenied = 102,
	k_EResultGSOwnerDenied = 103,
	k_EResultInvalidItemType = 104,
	k_EResultIPBanned = 105,
	k_EResultGSLTExpired = 106,
	k_EResultInsufficientFunds = 107,
	k_EResultTooManyPending = 108
} SteamWorks_EResult;
typedef enum SteamWorks_EVoiceResult {
	k_EVoiceResultOK = 0,
	k_EVoiceResultNotInitialized = 1,
	k_EVoiceResultNotRecording = 2,
	k_EVoiceResultNoData = 3,
	k_EVoiceResultBufferTooSmall = 4,
	k_EVoiceResultDataCorrupted = 5,
	k_EVoiceResultRestricted = 6,
	k_EVoiceResultUnsupportedCodec = 7,
	k_EVoiceResultReceiverOutOfDate = 8,
	k_EVoiceResultReceiverDidNotAnswer = 9
} SteamWorks_EVoiceResult;
typedef enum SteamWorks_EDenyReason {
	k_EDenyInvalid = 0,
	k_EDenyInvalidVersion = 1,
	k_EDenyGeneric = 2,
	k_EDenyNotLoggedOn = 3,
	k_EDenyNoLicense = 4,
	k_EDenyCheater = 5,
	k_EDenyLoggedInElseWhere = 6,
	k_EDenyUnknownText = 7,
	k_EDenyIncompatibleAnticheat = 8,
	k_EDenyMemoryCorruption = 9,
	k_EDenyIncompatibleSoftware = 10,
	k_EDenySteamConnectionLost = 11,
	k_EDenySteamConnectionError = 12,
	k_EDenySteamResponseTimedOut = 13,
	k_EDenySteamValidationStalled = 14,
	k_EDenySteamOwnerLeftGuestUser = 15
} SteamWorks_EDenyReason;
typedef enum SteamWorks_EBeginAuthSessionResult {
	k_EBeginAuthSessionResultOK = 0,
	k_EBeginAuthSessionResultInvalidTicket = 1,
	k_EBeginAuthSessionResultDuplicateRequest = 2,
	k_EBeginAuthSessionResultInvalidVersion = 3,
	k_EBeginAuthSessionResultGameMismatch = 4,
	k_EBeginAuthSessionResultExpiredTicket = 5
} SteamWorks_EBeginAuthSessionResult;
typedef enum SteamWorks_EAuthSessionResponse {
	k_EAuthSessionResponseOK = 0,
	k_EAuthSessionResponseUserNotConnectedToSteam = 1,
	k_EAuthSessionResponseNoLicenseOrExpired = 2,
	k_EAuthSessionResponseVACBanned = 3,
	k_EAuthSessionResponseLoggedInElseWhere = 4,
	k_EAuthSessionResponseVACCheckTimedOut = 5,
	k_EAuthSessionResponseAuthTicketCanceled = 6,
	k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed = 7,
	k_EAuthSessionResponseAuthTicketInvalid = 8,
	k_EAuthSessionResponsePublisherIssuedBan = 9
} SteamWorks_EAuthSessionResponse;
typedef enum SteamWorks_EUserHasLicenseForAppResult {
	k_EUserHasLicenseResultHasLicense = 0,
	k_EUserHasLicenseResultDoesNotHaveLicense = 1,
	k_EUserHasLicenseResultNoAuth = 2
} SteamWorks_EUserHasLicenseForAppResult;
typedef enum SteamWorks_EAccountType {
	k_EAccountTypeInvalid = 0,
	k_EAccountTypeIndividual = 1,
	k_EAccountTypeMultiseat = 2,
	k_EAccountTypeGameServer = 3,
	k_EAccountTypeAnonGameServer = 4,
	k_EAccountTypePending = 5,
	k_EAccountTypeContentServer = 6,
	k_EAccountTypeClan = 7,
	k_EAccountTypeChat = 8,
	k_EAccountTypeConsoleUser = 9,
	k_EAccountTypeAnonUser = 10,
	k_EAccountTypeMax = 11
} SteamWorks_EAccountType;
typedef enum SteamWorks_EAppReleaseState {
	k_EAppReleaseState_Unknown = 0,
	k_EAppReleaseState_Unavailable = 1,
	k_EAppReleaseState_Prerelease = 2,
	k_EAppReleaseState_PreloadOnly = 3,
	k_EAppReleaseState_Released = 4
} SteamWorks_EAppReleaseState;
typedef enum SteamWorks_EAppOwnershipFlags {
	k_EAppOwnershipFlags_None = 0,
	k_EAppOwnershipFlags_OwnsLicense = 1,
	k_EAppOwnershipFlags_FreeLicense = 2,
	k_EAppOwnershipFlags_RegionRestricted = 4,
	k_EAppOwnershipFlags_LowViolence = 8,
	k_EAppOwnershipFlags_InvalidPlatform = 16,
	k_EAppOwnershipFlags_SharedLicense = 32,
	k_EAppOwnershipFlags_FreeWeekend = 64,
	k_EAppOwnershipFlags_RetailLicense = 128,
	k_EAppOwnershipFlags_LicenseLocked = 256,
	k_EAppOwnershipFlags_LicensePending = 512,
	k_EAppOwnershipFlags_LicenseExpired = 1024,
	k_EAppOwnershipFlags_LicensePermanent = 2048,
	k_EAppOwnershipFlags_LicenseRecurring = 4096,
	k_EAppOwnershipFlags_LicenseCanceled = 8192,
	k_EAppOwnershipFlags_AutoGrant = 16384,
	k_EAppOwnershipFlags_PendingGift = 32768,
	k_EAppOwnershipFlags_RentalNotActivated = 65536,
	k_EAppOwnershipFlags_Rental = 131072,
	k_EAppOwnershipFlags_SiteLicense = 262144
} SteamWorks_EAppOwnershipFlags;
typedef enum SteamWorks_EAppType {
	k_EAppType_Invalid = 0,
	k_EAppType_Game = 1,
	k_EAppType_Application = 2,
	k_EAppType_Tool = 4,
	k_EAppType_Demo = 8,
	k_EAppType_Media_DEPRECATED = 16,
	k_EAppType_DLC = 32,
	k_EAppType_Guide = 64,
	k_EAppType_Driver = 128,
	k_EAppType_Config = 256,
	k_EAppType_Hardware = 512,
	k_EAppType_Franchise = 1024,
	k_EAppType_Video = 2048,
	k_EAppType_Plugin = 4096,
	k_EAppType_Music = 8192,
	k_EAppType_Series = 16384,
	k_EAppType_Shortcut = 1073741824,
	k_EAppType_DepotOnly = -2147483648
} SteamWorks_EAppType;
typedef enum SteamWorks_ESteamUserStatType {
	k_ESteamUserStatTypeINVALID = 0,
	k_ESteamUserStatTypeINT = 1,
	k_ESteamUserStatTypeFLOAT = 2,
	k_ESteamUserStatTypeAVGRATE = 3,
	k_ESteamUserStatTypeACHIEVEMENTS = 4,
	k_ESteamUserStatTypeGROUPACHIEVEMENTS = 5,
	k_ESteamUserStatTypeMAX = 6
} SteamWorks_ESteamUserStatType;
typedef enum SteamWorks_EChatEntryType {
	k_EChatEntryTypeInvalid = 0,
	k_EChatEntryTypeChatMsg = 1,
	k_EChatEntryTypeTyping = 2,
	k_EChatEntryTypeInviteGame = 3,
	k_EChatEntryTypeEmote = 4,
	k_EChatEntryTypeLeftConversation = 6,
	k_EChatEntryTypeEntered = 7,
	k_EChatEntryTypeWasKicked = 8,
	k_EChatEntryTypeWasBanned = 9,
	k_EChatEntryTypeDisconnected = 10,
	k_EChatEntryTypeHistoricalChat = 11,
	k_EChatEntryTypeLinkBlocked = 14
} SteamWorks_EChatEntryType;
typedef enum SteamWorks_EChatRoomEnterResponse {
	k_EChatRoomEnterResponseSuccess = 1,
	k_EChatRoomEnterResponseDoesntExist = 2,
	k_EChatRoomEnterResponseNotAllowed = 3,
	k_EChatRoomEnterResponseFull = 4,
	k_EChatRoomEnterResponseError = 5,
	k_EChatRoomEnterResponseBanned = 6,
	k_EChatRoomEnterResponseLimited = 7,
	k_EChatRoomEnterResponseClanDisabled = 8,
	k_EChatRoomEnterResponseCommunityBan = 9,
	k_EChatRoomEnterResponseMemberBlockedYou = 10,
	k_EChatRoomEnterResponseYouBlockedMember = 11
} SteamWorks_EChatRoomEnterResponse;
typedef enum SteamWorks_EChatSteamIDInstanceFlags {
	k_EChatAccountInstanceMask = 4095,
	k_EChatInstanceFlagClan = 524288,
	k_EChatInstanceFlagLobby = 262144,
	k_EChatInstanceFlagMMSLobby = 131072
} SteamWorks_EChatSteamIDInstanceFlags;
typedef enum SteamWorks_EMarketingMessageFlags {
	k_EMarketingMessageFlagsNone = 0,
	k_EMarketingMessageFlagsHighPriority = 1,
	k_EMarketingMessageFlagsPlatformWindows = 2,
	k_EMarketingMessageFlagsPlatformMac = 4,
	k_EMarketingMessageFlagsPlatformLinux = 8,
	k_EMarketingMessageFlagsPlatformRestrictions = 14
} SteamWorks_EMarketingMessageFlags;
typedef enum SteamWorks_ENotificationPosition {
	k_EPositionTopLeft = 0,
	k_EPositionTopRight = 1,
	k_EPositionBottomLeft = 2,
	k_EPositionBottomRight = 3
} SteamWorks_ENotificationPosition;
typedef enum SteamWorks_EBroadcastUploadResult {
	k_EBroadcastUploadResultNone = 0,
	k_EBroadcastUploadResultOK = 1,
	k_EBroadcastUploadResultInitFailed = 2,
	k_EBroadcastUploadResultFrameFailed = 3,
	k_EBroadcastUploadResultTimeout = 4,
	k_EBroadcastUploadResultBandwidthExceeded = 5,
	k_EBroadcastUploadResultLowFPS = 6,
	k_EBroadcastUploadResultMissingKeyFrames = 7,
	k_EBroadcastUploadResultNoConnection = 8,
	k_EBroadcastUploadResultRelayFailed = 9,
	k_EBroadcastUploadResultSettingsChanged = 10,
	k_EBroadcastUploadResultMissingAudio = 11,
	k_EBroadcastUploadResultTooFarBehind = 12,
	k_EBroadcastUploadResultTranscodeBehind = 13
} SteamWorks_EBroadcastUploadResult;
typedef enum SteamWorks_ELaunchOptionType {
	k_ELaunchOptionType_None = 0,
	k_ELaunchOptionType_Default = 1,
	k_ELaunchOptionType_SafeMode = 2,
	k_ELaunchOptionType_Multiplayer = 3,
	k_ELaunchOptionType_Config = 4,
	k_ELaunchOptionType_OpenVR = 5,
	k_ELaunchOptionType_Server = 6,
	k_ELaunchOptionType_Editor = 7,
	k_ELaunchOptionType_Manual = 8,
	k_ELaunchOptionType_Benchmark = 9,
	k_ELaunchOptionType_Option1 = 10,
	k_ELaunchOptionType_Option2 = 11,
	k_ELaunchOptionType_Option3 = 12,
	k_ELaunchOptionType_OculusVR = 13,
	k_ELaunchOptionType_OpenVROverlay = 14,
	k_ELaunchOptionType_OSVR = 15,
	k_ELaunchOptionType_Dialog = 1000
} SteamWorks_ELaunchOptionType;
typedef enum SteamWorks_EVRHMDType {
	k_eEVRHMDType_None = -1,
	k_eEVRHMDType_Unknown = 0,
	k_eEVRHMDType_HTC_Dev = 1,
	k_eEVRHMDType_HTC_VivePre = 2,
	k_eEVRHMDType_HTC_Vive = 3,
	k_eEVRHMDType_HTC_Unknown = 20,
	k_eEVRHMDType_Oculus_DK1 = 21,
	k_eEVRHMDType_Oculus_DK2 = 22,
	k_eEVRHMDType_Oculus_Rift = 23,
	k_eEVRHMDType_Oculus_Unknown = 40
} SteamWorks_EVRHMDType;
typedef enum SteamWorks_CGameID_EGameIDType {
	k_EGameIDTypeApp = 0,
	k_EGameIDTypeGameMod = 1,
	k_EGameIDTypeShortcut = 2,
	k_EGameIDTypeP2P = 3
} SteamWorks_CGameID_EGameIDType;
typedef enum SteamWorks_IPCFailure_t_EFailureType {
	k_EFailureFlushedCallbackQueue = 0,
	k_EFailurePipeFail = 1
} SteamWorks_IPCFailure_t_EFailureType;
typedef enum SteamWorks_EFriendRelationship {
	k_EFriendRelationshipNone = 0,
	k_EFriendRelationshipBlocked = 1,
	k_EFriendRelationshipRequestRecipient = 2,
	k_EFriendRelationshipFriend = 3,
	k_EFriendRelationshipRequestInitiator = 4,
	k_EFriendRelationshipIgnored = 5,
	k_EFriendRelationshipIgnoredFriend = 6,
	k_EFriendRelationshipSuggested_DEPRECATED = 7,
	k_EFriendRelationshipMax = 8
} SteamWorks_EFriendRelationship;
typedef enum SteamWorks_EPersonaState {
	k_EPersonaStateOffline = 0,
	k_EPersonaStateOnline = 1,
	k_EPersonaStateBusy = 2,
	k_EPersonaStateAway = 3,
	k_EPersonaStateSnooze = 4,
	k_EPersonaStateLookingToTrade = 5,
	k_EPersonaStateLookingToPlay = 6,
	k_EPersonaStateMax = 7
} SteamWorks_EPersonaState;
typedef enum SteamWorks_EFriendFlags {
	k_EFriendFlagNone = 0,
	k_EFriendFlagBlocked = 1,
	k_EFriendFlagFriendshipRequested = 2,
	k_EFriendFlagImmediate = 4,
	k_EFriendFlagClanMember = 8,
	k_EFriendFlagOnGameServer = 16,
	k_EFriendFlagRequestingFriendship = 128,
	k_EFriendFlagRequestingInfo = 256,
	k_EFriendFlagIgnored = 512,
	k_EFriendFlagIgnoredFriend = 1024,
	k_EFriendFlagChatMember = 4096,
	k_EFriendFlagAll = 65535
} SteamWorks_EFriendFlags;
typedef enum SteamWorks_EUserRestriction {
	k_nUserRestrictionNone = 0,
	k_nUserRestrictionUnknown = 1,
	k_nUserRestrictionAnyChat = 2,
	k_nUserRestrictionVoiceChat = 4,
	k_nUserRestrictionGroupChat = 8,
	k_nUserRestrictionRating = 16,
	k_nUserRestrictionGameInvites = 32,
	k_nUserRestrictionTrading = 64
} SteamWorks_EUserRestriction;
typedef enum SteamWorks_EOverlayToStoreFlag {
	k_EOverlayToStoreFlag_None = 0,
	k_EOverlayToStoreFlag_AddToCart = 1,
	k_EOverlayToStoreFlag_AddToCartAndShow = 2
} SteamWorks_EOverlayToStoreFlag;
typedef enum SteamWorks_EPersonaChange {
	k_EPersonaChangeName = 1,
	k_EPersonaChangeStatus = 2,
	k_EPersonaChangeComeOnline = 4,
	k_EPersonaChangeGoneOffline = 8,
	k_EPersonaChangeGamePlayed = 16,
	k_EPersonaChangeGameServer = 32,
	k_EPersonaChangeAvatar = 64,
	k_EPersonaChangeJoinedSource = 128,
	k_EPersonaChangeLeftSource = 256,
	k_EPersonaChangeRelationshipChanged = 512,
	k_EPersonaChangeNameFirstSet = 1024,
	k_EPersonaChangeFacebookInfo = 2048,
	k_EPersonaChangeNickname = 4096,
	k_EPersonaChangeSteamLevel = 8192
} SteamWorks_EPersonaChange;
typedef enum SteamWorks_ESteamAPICallFailure {
	k_ESteamAPICallFailureNone = -1,
	k_ESteamAPICallFailureSteamGone = 0,
	k_ESteamAPICallFailureNetworkFailure = 1,
	k_ESteamAPICallFailureInvalidHandle = 2,
	k_ESteamAPICallFailureMismatchedCallback = 3
} SteamWorks_ESteamAPICallFailure;
typedef enum SteamWorks_EGamepadTextInputMode {
	k_EGamepadTextInputModeNormal = 0,
	k_EGamepadTextInputModePassword = 1
} SteamWorks_EGamepadTextInputMode;
typedef enum SteamWorks_EGamepadTextInputLineMode {
	k_EGamepadTextInputLineModeSingleLine = 0,
	k_EGamepadTextInputLineModeMultipleLines = 1
} SteamWorks_EGamepadTextInputLineMode;
typedef enum SteamWorks_ECheckFileSignature {
	k_ECheckFileSignatureInvalidSignature = 0,
	k_ECheckFileSignatureValidSignature = 1,
	k_ECheckFileSignatureFileNotFound = 2,
	k_ECheckFileSignatureNoSignaturesFoundForThisApp = 3,
	k_ECheckFileSignatureNoSignaturesFoundForThisFile = 4
} SteamWorks_ECheckFileSignature;
typedef enum SteamWorks_EMatchMakingServerResponse {
	eServerResponded = 0,
	eServerFailedToRespond = 1,
	eNoServersListedOnMasterServer = 2
} SteamWorks_EMatchMakingServerResponse;
typedef enum SteamWorks_ELobbyType {
	k_ELobbyTypePrivate = 0,
	k_ELobbyTypeFriendsOnly = 1,
	k_ELobbyTypePublic = 2,
	k_ELobbyTypeInvisible = 3
} SteamWorks_ELobbyType;
typedef enum SteamWorks_ELobbyComparison {
	k_ELobbyComparisonEqualToOrLessThan = -2,
	k_ELobbyComparisonLessThan = -1,
	k_ELobbyComparisonEqual = 0,
	k_ELobbyComparisonGreaterThan = 1,
	k_ELobbyComparisonEqualToOrGreaterThan = 2,
	k_ELobbyComparisonNotEqual = 3
} SteamWorks_ELobbyComparison;
typedef enum SteamWorks_ELobbyDistanceFilter {
	k_ELobbyDistanceFilterClose = 0,
	k_ELobbyDistanceFilterDefault = 1,
	k_ELobbyDistanceFilterFar = 2,
	k_ELobbyDistanceFilterWorldwide = 3
} SteamWorks_ELobbyDistanceFilter;
typedef enum SteamWorks_EChatMemberStateChange {
	k_EChatMemberStateChangeEntered = 1,
	k_EChatMemberStateChangeLeft = 2,
	k_EChatMemberStateChangeDisconnected = 4,
	k_EChatMemberStateChangeKicked = 8,
	k_EChatMemberStateChangeBanned = 16
} SteamWorks_EChatMemberStateChange;
typedef enum SteamWorks_ERemoteStoragePlatform {
	k_ERemoteStoragePlatformNone = 0,
	k_ERemoteStoragePlatformWindows = 1,
	k_ERemoteStoragePlatformOSX = 2,
	k_ERemoteStoragePlatformPS3 = 4,
	k_ERemoteStoragePlatformLinux = 8,
	k_ERemoteStoragePlatformReserved2 = 16,
	k_ERemoteStoragePlatformAll = -1
} SteamWorks_ERemoteStoragePlatform;
typedef enum SteamWorks_ERemoteStoragePublishedFileVisibility {
	k_ERemoteStoragePublishedFileVisibilityPublic = 0,
	k_ERemoteStoragePublishedFileVisibilityFriendsOnly = 1,
	k_ERemoteStoragePublishedFileVisibilityPrivate = 2
} SteamWorks_ERemoteStoragePublishedFileVisibility;
typedef enum SteamWorks_EWorkshopFileType {
	k_EWorkshopFileTypeFirst = 0,
	k_EWorkshopFileTypeCommunity = 0,
	k_EWorkshopFileTypeMicrotransaction = 1,
	k_EWorkshopFileTypeCollection = 2,
	k_EWorkshopFileTypeArt = 3,
	k_EWorkshopFileTypeVideo = 4,
	k_EWorkshopFileTypeScreenshot = 5,
	k_EWorkshopFileTypeGame = 6,
	k_EWorkshopFileTypeSoftware = 7,
	k_EWorkshopFileTypeConcept = 8,
	k_EWorkshopFileTypeWebGuide = 9,
	k_EWorkshopFileTypeIntegratedGuide = 10,
	k_EWorkshopFileTypeMerch = 11,
	k_EWorkshopFileTypeControllerBinding = 12,
	k_EWorkshopFileTypeSteamworksAccessInvite = 13,
	k_EWorkshopFileTypeSteamVideo = 14,
	k_EWorkshopFileTypeGameManagedItem = 15,
	k_EWorkshopFileTypeMax = 16
} SteamWorks_EWorkshopFileType;
typedef enum SteamWorks_EWorkshopVote {
	k_EWorkshopVoteUnvoted = 0,
	k_EWorkshopVoteFor = 1,
	k_EWorkshopVoteAgainst = 2,
	k_EWorkshopVoteLater = 3
} SteamWorks_EWorkshopVote;
typedef enum SteamWorks_EWorkshopFileAction {
	k_EWorkshopFileActionPlayed = 0,
	k_EWorkshopFileActionCompleted = 1
} SteamWorks_EWorkshopFileAction;
typedef enum SteamWorks_EWorkshopEnumerationType {
	k_EWorkshopEnumerationTypeRankedByVote = 0,
	k_EWorkshopEnumerationTypeRecent = 1,
	k_EWorkshopEnumerationTypeTrending = 2,
	k_EWorkshopEnumerationTypeFavoritesOfFriends = 3,
	k_EWorkshopEnumerationTypeVotedByFriends = 4,
	k_EWorkshopEnumerationTypeContentByFriends = 5,
	k_EWorkshopEnumerationTypeRecentFromFollowedUsers = 6
} SteamWorks_EWorkshopEnumerationType;
typedef enum SteamWorks_EWorkshopVideoProvider {
	k_EWorkshopVideoProviderNone = 0,
	k_EWorkshopVideoProviderYoutube = 1
} SteamWorks_EWorkshopVideoProvider;
typedef enum SteamWorks_EUGCReadAction {
	k_EUGCRead_ContinueReadingUntilFinished = 0,
	k_EUGCRead_ContinueReading = 1,
	k_EUGCRead_Close = 2
} SteamWorks_EUGCReadAction;
typedef enum SteamWorks_ELeaderboardDataRequest {
	k_ELeaderboardDataRequestGlobal = 0,
	k_ELeaderboardDataRequestGlobalAroundUser = 1,
	k_ELeaderboardDataRequestFriends = 2,
	k_ELeaderboardDataRequestUsers = 3
} SteamWorks_ELeaderboardDataRequest;
typedef enum SteamWorks_ELeaderboardSortMethod {
	k_ELeaderboardSortMethodNone = 0,
	k_ELeaderboardSortMethodAscending = 1,
	k_ELeaderboardSortMethodDescending = 2
} SteamWorks_ELeaderboardSortMethod;
typedef enum SteamWorks_ELeaderboardDisplayType {
	k_ELeaderboardDisplayTypeNone = 0,
	k_ELeaderboardDisplayTypeNumeric = 1,
	k_ELeaderboardDisplayTypeTimeSeconds = 2,
	k_ELeaderboardDisplayTypeTimeMilliSeconds = 3
} SteamWorks_ELeaderboardDisplayType;
typedef enum SteamWorks_ELeaderboardUploadScoreMethod {
	k_ELeaderboardUploadScoreMethodNone = 0,
	k_ELeaderboardUploadScoreMethodKeepBest = 1,
	k_ELeaderboardUploadScoreMethodForceUpdate = 2
} SteamWorks_ELeaderboardUploadScoreMethod;
typedef enum SteamWorks_ERegisterActivationCodeResult {
	k_ERegisterActivationCodeResultOK = 0,
	k_ERegisterActivationCodeResultFail = 1,
	k_ERegisterActivationCodeResultAlreadyRegistered = 2,
	k_ERegisterActivationCodeResultTimeout = 3,
	k_ERegisterActivationCodeAlreadyOwned = 4
} SteamWorks_ERegisterActivationCodeResult;
typedef enum SteamWorks_EP2PSessionError {
	k_EP2PSessionErrorNone = 0,
	k_EP2PSessionErrorNotRunningApp = 1,
	k_EP2PSessionErrorNoRightsToApp = 2,
	k_EP2PSessionErrorDestinationNotLoggedIn = 3,
	k_EP2PSessionErrorTimeout = 4,
	k_EP2PSessionErrorMax = 5
} SteamWorks_EP2PSessionError;
typedef enum SteamWorks_EP2PSend {
	k_EP2PSendUnreliable = 0,
	k_EP2PSendUnreliableNoDelay = 1,
	k_EP2PSendReliable = 2,
	k_EP2PSendReliableWithBuffering = 3
} SteamWorks_EP2PSend;
typedef enum SteamWorks_ESNetSocketState {
	k_ESNetSocketStateInvalid = 0,
	k_ESNetSocketStateConnected = 1,
	k_ESNetSocketStateInitiated = 10,
	k_ESNetSocketStateLocalCandidatesFound = 11,
	k_ESNetSocketStateReceivedRemoteCandidates = 12,
	k_ESNetSocketStateChallengeHandshake = 15,
	k_ESNetSocketStateDisconnecting = 21,
	k_ESNetSocketStateLocalDisconnect = 22,
	k_ESNetSocketStateTimeoutDuringConnect = 23,
	k_ESNetSocketStateRemoteEndDisconnected = 24,
	k_ESNetSocketStateConnectionBroken = 25
} SteamWorks_ESNetSocketState;
typedef enum SteamWorks_ESNetSocketConnectionType {
	k_ESNetSocketConnectionTypeNotConnected = 0,
	k_ESNetSocketConnectionTypeUDP = 1,
	k_ESNetSocketConnectionTypeUDPRelay = 2
} SteamWorks_ESNetSocketConnectionType;
typedef enum SteamWorks_EVRScreenshotType {
	k_EVRScreenshotType_None = 0,
	k_EVRScreenshotType_Mono = 1,
	k_EVRScreenshotType_Stereo = 2,
	k_EVRScreenshotType_MonoCubemap = 3,
	k_EVRScreenshotType_MonoPanorama = 4,
	k_EVRScreenshotType_StereoPanorama = 5
} SteamWorks_EVRScreenshotType;
typedef enum SteamWorks_AudioPlayback_Status {
	AudioPlayback_Undefined = 0,
	AudioPlayback_Playing = 1,
	AudioPlayback_Paused = 2,
	AudioPlayback_Idle = 3
} SteamWorks_AudioPlayback_Status;
typedef enum SteamWorks_EHTTPMethod {
	k_EHTTPMethodInvalid = 0,
	k_EHTTPMethodGET = 1,
	k_EHTTPMethodHEAD = 2,
	k_EHTTPMethodPOST = 3,
	k_EHTTPMethodPUT = 4,
	k_EHTTPMethodDELETE = 5,
	k_EHTTPMethodOPTIONS = 6,
	k_EHTTPMethodPATCH = 7
} SteamWorks_EHTTPMethod;
typedef enum SteamWorks_EHTTPStatusCode {
	k_EHTTPStatusCodeInvalid = 0,
	k_EHTTPStatusCode100Continue = 100,
	k_EHTTPStatusCode101SwitchingProtocols = 101,
	k_EHTTPStatusCode200OK = 200,
	k_EHTTPStatusCode201Created = 201,
	k_EHTTPStatusCode202Accepted = 202,
	k_EHTTPStatusCode203NonAuthoritative = 203,
	k_EHTTPStatusCode204NoContent = 204,
	k_EHTTPStatusCode205ResetContent = 205,
	k_EHTTPStatusCode206PartialContent = 206,
	k_EHTTPStatusCode300MultipleChoices = 300,
	k_EHTTPStatusCode301MovedPermanently = 301,
	k_EHTTPStatusCode302Found = 302,
	k_EHTTPStatusCode303SeeOther = 303,
	k_EHTTPStatusCode304NotModified = 304,
	k_EHTTPStatusCode305UseProxy = 305,
	k_EHTTPStatusCode307TemporaryRedirect = 307,
	k_EHTTPStatusCode400BadRequest = 400,
	k_EHTTPStatusCode401Unauthorized = 401,
	k_EHTTPStatusCode402PaymentRequired = 402,
	k_EHTTPStatusCode403Forbidden = 403,
	k_EHTTPStatusCode404NotFound = 404,
	k_EHTTPStatusCode405MethodNotAllowed = 405,
	k_EHTTPStatusCode406NotAcceptable = 406,
	k_EHTTPStatusCode407ProxyAuthRequired = 407,
	k_EHTTPStatusCode408RequestTimeout = 408,
	k_EHTTPStatusCode409Conflict = 409,
	k_EHTTPStatusCode410Gone = 410,
	k_EHTTPStatusCode411LengthRequired = 411,
	k_EHTTPStatusCode412PreconditionFailed = 412,
	k_EHTTPStatusCode413RequestEntityTooLarge = 413,
	k_EHTTPStatusCode414RequestURITooLong = 414,
	k_EHTTPStatusCode415UnsupportedMediaType = 415,
	k_EHTTPStatusCode416RequestedRangeNotSatisfiable = 416,
	k_EHTTPStatusCode417ExpectationFailed = 417,
	k_EHTTPStatusCode4xxUnknown = 418,
	k_EHTTPStatusCode429TooManyRequests = 429,
	k_EHTTPStatusCode500InternalServerError = 500,
	k_EHTTPStatusCode501NotImplemented = 501,
	k_EHTTPStatusCode502BadGateway = 502,
	k_EHTTPStatusCode503ServiceUnavailable = 503,
	k_EHTTPStatusCode504GatewayTimeout = 504,
	k_EHTTPStatusCode505HTTPVersionNotSupported = 505,
	k_EHTTPStatusCode5xxUnknown = 599
} SteamWorks_EHTTPStatusCode;
typedef enum SteamWorks_ESteamControllerPad {
	k_ESteamControllerPad_Left = 0,
	k_ESteamControllerPad_Right = 1
} SteamWorks_ESteamControllerPad;
typedef enum SteamWorks_EControllerSource {
	k_EControllerSource_None = 0,
	k_EControllerSource_LeftTrackpad = 1,
	k_EControllerSource_RightTrackpad = 2,
	k_EControllerSource_Joystick = 3,
	k_EControllerSource_ABXY = 4,
	k_EControllerSource_Switch = 5,
	k_EControllerSource_LeftTrigger = 6,
	k_EControllerSource_RightTrigger = 7,
	k_EControllerSource_Gyro = 8,
	k_EControllerSource_CenterTrackpad = 9,
	k_EControllerSource_RightJoystick = 10,
	k_EControllerSource_DPad = 11,
	k_EControllerSource_Count = 12
} SteamWorks_EControllerSource;
typedef enum SteamWorks_EControllerSourceMode {
	k_EControllerSourceMode_None = 0,
	k_EControllerSourceMode_Dpad = 1,
	k_EControllerSourceMode_Buttons = 2,
	k_EControllerSourceMode_FourButtons = 3,
	k_EControllerSourceMode_AbsoluteMouse = 4,
	k_EControllerSourceMode_RelativeMouse = 5,
	k_EControllerSourceMode_JoystickMove = 6,
	k_EControllerSourceMode_JoystickMouse = 7,
	k_EControllerSourceMode_JoystickCamera = 8,
	k_EControllerSourceMode_ScrollWheel = 9,
	k_EControllerSourceMode_Trigger = 10,
	k_EControllerSourceMode_TouchMenu = 11,
	k_EControllerSourceMode_MouseJoystick = 12,
	k_EControllerSourceMode_MouseRegion = 13,
	k_EControllerSourceMode_RadialMenu = 14,
	k_EControllerSourceMode_SingleButton = 15,
	k_EControllerSourceMode_Switches = 16
} SteamWorks_EControllerSourceMode;
typedef enum SteamWorks_EControllerActionOrigin {
	k_EControllerActionOrigin_None = 0,
	k_EControllerActionOrigin_A = 1,
	k_EControllerActionOrigin_B = 2,
	k_EControllerActionOrigin_X = 3,
	k_EControllerActionOrigin_Y = 4,
	k_EControllerActionOrigin_LeftBumper = 5,
	k_EControllerActionOrigin_RightBumper = 6,
	k_EControllerActionOrigin_LeftGrip = 7,
	k_EControllerActionOrigin_RightGrip = 8,
	k_EControllerActionOrigin_Start = 9,
	k_EControllerActionOrigin_Back = 10,
	k_EControllerActionOrigin_LeftPad_Touch = 11,
	k_EControllerActionOrigin_LeftPad_Swipe = 12,
	k_EControllerActionOrigin_LeftPad_Click = 13,
	k_EControllerActionOrigin_LeftPad_DPadNorth = 14,
	k_EControllerActionOrigin_LeftPad_DPadSouth = 15,
	k_EControllerActionOrigin_LeftPad_DPadWest = 16,
	k_EControllerActionOrigin_LeftPad_DPadEast = 17,
	k_EControllerActionOrigin_RightPad_Touch = 18,
	k_EControllerActionOrigin_RightPad_Swipe = 19,
	k_EControllerActionOrigin_RightPad_Click = 20,
	k_EControllerActionOrigin_RightPad_DPadNorth = 21,
	k_EControllerActionOrigin_RightPad_DPadSouth = 22,
	k_EControllerActionOrigin_RightPad_DPadWest = 23,
	k_EControllerActionOrigin_RightPad_DPadEast = 24,
	k_EControllerActionOrigin_LeftTrigger_Pull = 25,
	k_EControllerActionOrigin_LeftTrigger_Click = 26,
	k_EControllerActionOrigin_RightTrigger_Pull = 27,
	k_EControllerActionOrigin_RightTrigger_Click = 28,
	k_EControllerActionOrigin_LeftStick_Move = 29,
	k_EControllerActionOrigin_LeftStick_Click = 30,
	k_EControllerActionOrigin_LeftStick_DPadNorth = 31,
	k_EControllerActionOrigin_LeftStick_DPadSouth = 32,
	k_EControllerActionOrigin_LeftStick_DPadWest = 33,
	k_EControllerActionOrigin_LeftStick_DPadEast = 34,
	k_EControllerActionOrigin_Gyro_Move = 35,
	k_EControllerActionOrigin_Gyro_Pitch = 36,
	k_EControllerActionOrigin_Gyro_Yaw = 37,
	k_EControllerActionOrigin_Gyro_Roll = 38,
	k_EControllerActionOrigin_PS4_X = 39,
	k_EControllerActionOrigin_PS4_Circle = 40,
	k_EControllerActionOrigin_PS4_Triangle = 41,
	k_EControllerActionOrigin_PS4_Square = 42,
	k_EControllerActionOrigin_PS4_LeftBumper = 43,
	k_EControllerActionOrigin_PS4_RightBumper = 44,
	k_EControllerActionOrigin_PS4_Options = 45,
	k_EControllerActionOrigin_PS4_Share = 46,
	k_EControllerActionOrigin_PS4_LeftPad_Touch = 47,
	k_EControllerActionOrigin_PS4_LeftPad_Swipe = 48,
	k_EControllerActionOrigin_PS4_LeftPad_Click = 49,
	k_EControllerActionOrigin_PS4_LeftPad_DPadNorth = 50,
	k_EControllerActionOrigin_PS4_LeftPad_DPadSouth = 51,
	k_EControllerActionOrigin_PS4_LeftPad_DPadWest = 52,
	k_EControllerActionOrigin_PS4_LeftPad_DPadEast = 53,
	k_EControllerActionOrigin_PS4_RightPad_Touch = 54,
	k_EControllerActionOrigin_PS4_RightPad_Swipe = 55,
	k_EControllerActionOrigin_PS4_RightPad_Click = 56,
	k_EControllerActionOrigin_PS4_RightPad_DPadNorth = 57,
	k_EControllerActionOrigin_PS4_RightPad_DPadSouth = 58,
	k_EControllerActionOrigin_PS4_RightPad_DPadWest = 59,
	k_EControllerActionOrigin_PS4_RightPad_DPadEast = 60,
	k_EControllerActionOrigin_PS4_CenterPad_Touch = 61,
	k_EControllerActionOrigin_PS4_CenterPad_Swipe = 62,
	k_EControllerActionOrigin_PS4_CenterPad_Click = 63,
	k_EControllerActionOrigin_PS4_CenterPad_DPadNorth = 64,
	k_EControllerActionOrigin_PS4_CenterPad_DPadSouth = 65,
	k_EControllerActionOrigin_PS4_CenterPad_DPadWest = 66,
	k_EControllerActionOrigin_PS4_CenterPad_DPadEast = 67,
	k_EControllerActionOrigin_PS4_LeftTrigger_Pull = 68,
	k_EControllerActionOrigin_PS4_LeftTrigger_Click = 69,
	k_EControllerActionOrigin_PS4_RightTrigger_Pull = 70,
	k_EControllerActionOrigin_PS4_RightTrigger_Click = 71,
	k_EControllerActionOrigin_PS4_LeftStick_Move = 72,
	k_EControllerActionOrigin_PS4_LeftStick_Click = 73,
	k_EControllerActionOrigin_PS4_LeftStick_DPadNorth = 74,
	k_EControllerActionOrigin_PS4_LeftStick_DPadSouth = 75,
	k_EControllerActionOrigin_PS4_LeftStick_DPadWest = 76,
	k_EControllerActionOrigin_PS4_LeftStick_DPadEast = 77,
	k_EControllerActionOrigin_PS4_RightStick_Move = 78,
	k_EControllerActionOrigin_PS4_RightStick_Click = 79,
	k_EControllerActionOrigin_PS4_RightStick_DPadNorth = 80,
	k_EControllerActionOrigin_PS4_RightStick_DPadSouth = 81,
	k_EControllerActionOrigin_PS4_RightStick_DPadWest = 82,
	k_EControllerActionOrigin_PS4_RightStick_DPadEast = 83,
	k_EControllerActionOrigin_PS4_DPad_North = 84,
	k_EControllerActionOrigin_PS4_DPad_South = 85,
	k_EControllerActionOrigin_PS4_DPad_West = 86,
	k_EControllerActionOrigin_PS4_DPad_East = 87,
	k_EControllerActionOrigin_PS4_Gyro_Move = 88,
	k_EControllerActionOrigin_PS4_Gyro_Pitch = 89,
	k_EControllerActionOrigin_PS4_Gyro_Yaw = 90,
	k_EControllerActionOrigin_PS4_Gyro_Roll = 91,
	k_EControllerActionOrigin_XBoxOne_A = 92,
	k_EControllerActionOrigin_XBoxOne_B = 93,
	k_EControllerActionOrigin_XBoxOne_X = 94,
	k_EControllerActionOrigin_XBoxOne_Y = 95,
	k_EControllerActionOrigin_XBoxOne_LeftBumper = 96,
	k_EControllerActionOrigin_XBoxOne_RightBumper = 97,
	k_EControllerActionOrigin_XBoxOne_Menu = 98,
	k_EControllerActionOrigin_XBoxOne_View = 99,
	k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull = 100,
	k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click = 101,
	k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull = 102,
	k_EControllerActionOrigin_XBoxOne_RightTrigger_Click = 103,
	k_EControllerActionOrigin_XBoxOne_LeftStick_Move = 104,
	k_EControllerActionOrigin_XBoxOne_LeftStick_Click = 105,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth = 106,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth = 107,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest = 108,
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast = 109,
	k_EControllerActionOrigin_XBoxOne_RightStick_Move = 110,
	k_EControllerActionOrigin_XBoxOne_RightStick_Click = 111,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth = 112,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth = 113,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest = 114,
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast = 115,
	k_EControllerActionOrigin_XBoxOne_DPad_North = 116,
	k_EControllerActionOrigin_XBoxOne_DPad_South = 117,
	k_EControllerActionOrigin_XBoxOne_DPad_West = 118,
	k_EControllerActionOrigin_XBoxOne_DPad_East = 119,
	k_EControllerActionOrigin_XBox360_A = 120,
	k_EControllerActionOrigin_XBox360_B = 121,
	k_EControllerActionOrigin_XBox360_X = 122,
	k_EControllerActionOrigin_XBox360_Y = 123,
	k_EControllerActionOrigin_XBox360_LeftBumper = 124,
	k_EControllerActionOrigin_XBox360_RightBumper = 125,
	k_EControllerActionOrigin_XBox360_Start = 126,
	k_EControllerActionOrigin_XBox360_Back = 127,
	k_EControllerActionOrigin_XBox360_LeftTrigger_Pull = 128,
	k_EControllerActionOrigin_XBox360_LeftTrigger_Click = 129,
	k_EControllerActionOrigin_XBox360_RightTrigger_Pull = 130,
	k_EControllerActionOrigin_XBox360_RightTrigger_Click = 131,
	k_EControllerActionOrigin_XBox360_LeftStick_Move = 132,
	k_EControllerActionOrigin_XBox360_LeftStick_Click = 133,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth = 134,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth = 135,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadWest = 136,
	k_EControllerActionOrigin_XBox360_LeftStick_DPadEast = 137,
	k_EControllerActionOrigin_XBox360_RightStick_Move = 138,
	k_EControllerActionOrigin_XBox360_RightStick_Click = 139,
	k_EControllerActionOrigin_XBox360_RightStick_DPadNorth = 140,
	k_EControllerActionOrigin_XBox360_RightStick_DPadSouth = 141,
	k_EControllerActionOrigin_XBox360_RightStick_DPadWest = 142,
	k_EControllerActionOrigin_XBox360_RightStick_DPadEast = 143,
	k_EControllerActionOrigin_XBox360_DPad_North = 144,
	k_EControllerActionOrigin_XBox360_DPad_South = 145,
	k_EControllerActionOrigin_XBox360_DPad_West = 146,
	k_EControllerActionOrigin_XBox360_DPad_East = 147,
	k_EControllerActionOrigin_SteamV2_A = 148,
	k_EControllerActionOrigin_SteamV2_B = 149,
	k_EControllerActionOrigin_SteamV2_X = 150,
	k_EControllerActionOrigin_SteamV2_Y = 151,
	k_EControllerActionOrigin_SteamV2_LeftBumper = 152,
	k_EControllerActionOrigin_SteamV2_RightBumper = 153,
	k_EControllerActionOrigin_SteamV2_LeftGrip = 154,
	k_EControllerActionOrigin_SteamV2_RightGrip = 155,
	k_EControllerActionOrigin_SteamV2_LeftGrip_Upper = 156,
	k_EControllerActionOrigin_SteamV2_RightGrip_Upper = 157,
	k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure = 158,
	k_EControllerActionOrigin_SteamV2_RightBumper_Pressure = 159,
	k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure = 160,
	k_EControllerActionOrigin_SteamV2_RightGrip_Pressure = 161,
	k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure = 162,
	k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure = 163,
	k_EControllerActionOrigin_SteamV2_Start = 164,
	k_EControllerActionOrigin_SteamV2_Back = 165,
	k_EControllerActionOrigin_SteamV2_LeftPad_Touch = 166,
	k_EControllerActionOrigin_SteamV2_LeftPad_Swipe = 167,
	k_EControllerActionOrigin_SteamV2_LeftPad_Click = 168,
	k_EControllerActionOrigin_SteamV2_LeftPad_Pressure = 169,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth = 170,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth = 171,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest = 172,
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast = 173,
	k_EControllerActionOrigin_SteamV2_RightPad_Touch = 174,
	k_EControllerActionOrigin_SteamV2_RightPad_Swipe = 175,
	k_EControllerActionOrigin_SteamV2_RightPad_Click = 176,
	k_EControllerActionOrigin_SteamV2_RightPad_Pressure = 177,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth = 178,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth = 179,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadWest = 180,
	k_EControllerActionOrigin_SteamV2_RightPad_DPadEast = 181,
	k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull = 182,
	k_EControllerActionOrigin_SteamV2_LeftTrigger_Click = 183,
	k_EControllerActionOrigin_SteamV2_RightTrigger_Pull = 184,
	k_EControllerActionOrigin_SteamV2_RightTrigger_Click = 185,
	k_EControllerActionOrigin_SteamV2_LeftStick_Move = 186,
	k_EControllerActionOrigin_SteamV2_LeftStick_Click = 187,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth = 188,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth = 189,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest = 190,
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast = 191,
	k_EControllerActionOrigin_SteamV2_Gyro_Move = 192,
	k_EControllerActionOrigin_SteamV2_Gyro_Pitch = 193,
	k_EControllerActionOrigin_SteamV2_Gyro_Yaw = 194,
	k_EControllerActionOrigin_SteamV2_Gyro_Roll = 195,
	k_EControllerActionOrigin_Count = 196
} SteamWorks_EControllerActionOrigin;
typedef enum SteamWorks_ESteamControllerLEDFlag {
	k_ESteamControllerLEDFlag_SetColor = 0,
	k_ESteamControllerLEDFlag_RestoreUserDefault = 1
} SteamWorks_ESteamControllerLEDFlag;
typedef enum SteamWorks_EUGCMatchingUGCType {
	k_EUGCMatchingUGCType_Items = 0,
	k_EUGCMatchingUGCType_Items_Mtx = 1,
	k_EUGCMatchingUGCType_Items_ReadyToUse = 2,
	k_EUGCMatchingUGCType_Collections = 3,
	k_EUGCMatchingUGCType_Artwork = 4,
	k_EUGCMatchingUGCType_Videos = 5,
	k_EUGCMatchingUGCType_Screenshots = 6,
	k_EUGCMatchingUGCType_AllGuides = 7,
	k_EUGCMatchingUGCType_WebGuides = 8,
	k_EUGCMatchingUGCType_IntegratedGuides = 9,
	k_EUGCMatchingUGCType_UsableInGame = 10,
	k_EUGCMatchingUGCType_ControllerBindings = 11,
	k_EUGCMatchingUGCType_GameManagedItems = 12,
	k_EUGCMatchingUGCType_All = -1
} SteamWorks_EUGCMatchingUGCType;
typedef enum SteamWorks_EUserUGCList {
	k_EUserUGCList_Published = 0,
	k_EUserUGCList_VotedOn = 1,
	k_EUserUGCList_VotedUp = 2,
	k_EUserUGCList_VotedDown = 3,
	k_EUserUGCList_WillVoteLater = 4,
	k_EUserUGCList_Favorited = 5,
	k_EUserUGCList_Subscribed = 6,
	k_EUserUGCList_UsedOrPlayed = 7,
	k_EUserUGCList_Followed = 8
} SteamWorks_EUserUGCList;
typedef enum SteamWorks_EUserUGCListSortOrder {
	k_EUserUGCListSortOrder_CreationOrderDesc = 0,
	k_EUserUGCListSortOrder_CreationOrderAsc = 1,
	k_EUserUGCListSortOrder_TitleAsc = 2,
	k_EUserUGCListSortOrder_LastUpdatedDesc = 3,
	k_EUserUGCListSortOrder_SubscriptionDateDesc = 4,
	k_EUserUGCListSortOrder_VoteScoreDesc = 5,
	k_EUserUGCListSortOrder_ForModeration = 6
} SteamWorks_EUserUGCListSortOrder;
typedef enum SteamWorks_EUGCQuery {
	k_EUGCQuery_RankedByVote = 0,
	k_EUGCQuery_RankedByPublicationDate = 1,
	k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate = 2,
	k_EUGCQuery_RankedByTrend = 3,
	k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate = 4,
	k_EUGCQuery_CreatedByFriendsRankedByPublicationDate = 5,
	k_EUGCQuery_RankedByNumTimesReported = 6,
	k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate = 7,
	k_EUGCQuery_NotYetRated = 8,
	k_EUGCQuery_RankedByTotalVotesAsc = 9,
	k_EUGCQuery_RankedByVotesUp = 10,
	k_EUGCQuery_RankedByTextSearch = 11,
	k_EUGCQuery_RankedByTotalUniqueSubscriptions = 12,
	k_EUGCQuery_RankedByPlaytimeTrend = 13,
	k_EUGCQuery_RankedByTotalPlaytime = 14,
	k_EUGCQuery_RankedByAveragePlaytimeTrend = 15,
	k_EUGCQuery_RankedByLifetimeAveragePlaytime = 16,
	k_EUGCQuery_RankedByPlaytimeSessionsTrend = 17,
	k_EUGCQuery_RankedByLifetimePlaytimeSessions = 18
} SteamWorks_EUGCQuery;
typedef enum SteamWorks_EItemUpdateStatus {
	k_EItemUpdateStatusInvalid = 0,
	k_EItemUpdateStatusPreparingConfig = 1,
	k_EItemUpdateStatusPreparingContent = 2,
	k_EItemUpdateStatusUploadingContent = 3,
	k_EItemUpdateStatusUploadingPreviewFile = 4,
	k_EItemUpdateStatusCommittingChanges = 5
} SteamWorks_EItemUpdateStatus;
typedef enum SteamWorks_EItemState {
	k_EItemStateNone = 0,
	k_EItemStateSubscribed = 1,
	k_EItemStateLegacyItem = 2,
	k_EItemStateInstalled = 4,
	k_EItemStateNeedsUpdate = 8,
	k_EItemStateDownloading = 16,
	k_EItemStateDownloadPending = 32
} SteamWorks_EItemState;
typedef enum SteamWorks_EItemStatistic {
	k_EItemStatistic_NumSubscriptions = 0,
	k_EItemStatistic_NumFavorites = 1,
	k_EItemStatistic_NumFollowers = 2,
	k_EItemStatistic_NumUniqueSubscriptions = 3,
	k_EItemStatistic_NumUniqueFavorites = 4,
	k_EItemStatistic_NumUniqueFollowers = 5,
	k_EItemStatistic_NumUniqueWebsiteViews = 6,
	k_EItemStatistic_ReportScore = 7,
	k_EItemStatistic_NumSecondsPlayed = 8,
	k_EItemStatistic_NumPlaytimeSessions = 9,
	k_EItemStatistic_NumComments = 10,
	k_EItemStatistic_NumSecondsPlayedDuringTimePeriod = 11,
	k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod = 12
} SteamWorks_EItemStatistic;
typedef enum SteamWorks_EItemPreviewType {
	k_EItemPreviewType_Image = 0,
	k_EItemPreviewType_YouTubeVideo = 1,
	k_EItemPreviewType_Sketchfab = 2,
	k_EItemPreviewType_EnvironmentMap_HorizontalCross = 3,
	k_EItemPreviewType_EnvironmentMap_LatLong = 4,
	k_EItemPreviewType_ReservedMax = 255
} SteamWorks_EItemPreviewType;
typedef enum SteamWorks_ISteamHTMLSurface_EHTMLMouseButton {
	eHTMLMouseButton_Left = 0,
	eHTMLMouseButton_Right = 1,
	eHTMLMouseButton_Middle = 2
} SteamWorks_ISteamHTMLSurface_EHTMLMouseButton;
typedef enum SteamWorks_ISteamHTMLSurface_EMouseCursor {
	dc_user = 0,
	dc_none = 1,
	dc_arrow = 2,
	dc_ibeam = 3,
	dc_hourglass = 4,
	dc_waitarrow = 5,
	dc_crosshair = 6,
	dc_up = 7,
	dc_sizenw = 8,
	dc_sizese = 9,
	dc_sizene = 10,
	dc_sizesw = 11,
	dc_sizew = 12,
	dc_sizee = 13,
	dc_sizen = 14,
	dc_sizes = 15,
	dc_sizewe = 16,
	dc_sizens = 17,
	dc_sizeall = 18,
	dc_no = 19,
	dc_hand = 20,
	dc_blank = 21,
	dc_middle_pan = 22,
	dc_north_pan = 23,
	dc_north_east_pan = 24,
	dc_east_pan = 25,
	dc_south_east_pan = 26,
	dc_south_pan = 27,
	dc_south_west_pan = 28,
	dc_west_pan = 29,
	dc_north_west_pan = 30,
	dc_alias = 31,
	dc_cell = 32,
	dc_colresize = 33,
	dc_copycur = 34,
	dc_verticaltext = 35,
	dc_rowresize = 36,
	dc_zoomin = 37,
	dc_zoomout = 38,
	dc_help = 39,
	dc_custom = 40,
	dc_last = 41
} SteamWorks_ISteamHTMLSurface_EMouseCursor;
typedef enum SteamWorks_ISteamHTMLSurface_EHTMLKeyModifiers {
	k_eHTMLKeyModifier_None = 0,
	k_eHTMLKeyModifier_AltDown = 1,
	k_eHTMLKeyModifier_CtrlDown = 2,
	k_eHTMLKeyModifier_ShiftDown = 4
} SteamWorks_ISteamHTMLSurface_EHTMLKeyModifiers;
typedef enum SteamWorks_ESteamItemFlags {
	k_ESteamItemNoTrade = 1,
	k_ESteamItemRemoved = 256,
	k_ESteamItemConsumed = 512
} SteamWorks_ESteamItemFlags;
typedef unsigned char SteamWorks_uint8;
typedef unsigned char SteamWorks_uint8;
typedef signed char SteamWorks_int8;
typedef short SteamWorks_int16;
typedef unsigned short SteamWorks_uint16;
typedef int SteamWorks_int32;
typedef unsigned int SteamWorks_uint32;
typedef long long SteamWorks_int64;
typedef unsigned long long SteamWorks_uint64;
typedef SteamWorks_int64 SteamWorks_lint64;
typedef SteamWorks_uint64 SteamWorks_ulint64;
typedef long long SteamWorks_intp;
typedef unsigned long long SteamWorks_uintp;
typedef SteamWorks_uint8 * SteamWorks_Salt_t;
typedef SteamWorks_uint64 SteamWorks_GID_t;
typedef SteamWorks_uint64 SteamWorks_JobID_t;
typedef SteamWorks_GID_t SteamWorks_TxnID_t;
typedef SteamWorks_uint32 SteamWorks_PackageId_t;
typedef SteamWorks_uint32 SteamWorks_BundleId_t;
typedef SteamWorks_uint32 SteamWorks_AppId_t;
typedef SteamWorks_uint64 SteamWorks_AssetClassId_t;
typedef SteamWorks_uint32 SteamWorks_PhysicalItemId_t;
typedef SteamWorks_uint32 SteamWorks_DepotId_t;
typedef SteamWorks_uint32 SteamWorks_RTime32;
typedef SteamWorks_uint32 SteamWorks_CellID_t;
typedef SteamWorks_uint64 SteamWorks_SteamAPICall_t;
typedef SteamWorks_uint32 SteamWorks_AccountID_t;
typedef SteamWorks_uint32 SteamWorks_PartnerId_t;
typedef SteamWorks_uint64 SteamWorks_ManifestId_t;
typedef SteamWorks_uint32 SteamWorks_HAuthTicket;
typedef void (*SteamWorks_PFNLegacyKeyRegistration)(const char *, const char *);
typedef bool (*SteamWorks_PFNLegacyKeyInstalled)(void);
typedef void (*SteamWorks_PFNPreMinidumpCallback)(void *);
typedef void * SteamWorks_BREAKPAD_HANDLE;
typedef struct ValvePackingSentinel_t SteamWorks_ValvePackingSentinel_t;
typedef char * SteamWorks_compile_time_assert_type;
typedef SteamWorks_int32 SteamWorks_HSteamPipe;
typedef SteamWorks_int32 SteamWorks_HSteamUser;
typedef void (*SteamWorks_SteamAPIWarningMessageHook_t)(int, const char *) ;
typedef SteamWorks_uint32 (*SteamWorks_SteamAPI_CheckCallbackRegistered_t)(int);
typedef SteamWorks_int16 SteamWorks_FriendsGroupID_t;
typedef void (*SteamWorks_SteamAPIWarningMessageHook_t)(int, const char *) ;
typedef void * SteamWorks_HServerListRequest;
typedef int SteamWorks_HServerQuery;
typedef SteamWorks_uint64 SteamWorks_UGCHandle_t;
typedef SteamWorks_uint64 SteamWorks_PublishedFileUpdateHandle_t;
typedef SteamWorks_uint64 SteamWorks_PublishedFileId_t;
typedef SteamWorks_uint64 SteamWorks_UGCFileWriteStreamHandle_t;
typedef char * SteamWorks_compile_time_assert_type;
typedef SteamWorks_uint64 SteamWorks_SteamLeaderboard_t;
typedef SteamWorks_uint64 SteamWorks_SteamLeaderboardEntries_t;
typedef SteamWorks_uint32 SteamWorks_SNetSocket_t;
typedef SteamWorks_uint32 SteamWorks_SNetListenSocket_t;
typedef SteamWorks_uint32 SteamWorks_ScreenshotHandle;
typedef struct PlaybackStatusHasChanged_t SteamWorks_PlaybackStatusHasChanged_t;
typedef struct VolumeHasChanged_t SteamWorks_VolumeHasChanged_t;
typedef struct MusicPlayerRemoteWillActivate_t SteamWorks_MusicPlayerRemoteWillActivate_t;
typedef struct MusicPlayerRemoteWillDeactivate_t SteamWorks_MusicPlayerRemoteWillDeactivate_t;
typedef struct MusicPlayerRemoteToFront_t SteamWorks_MusicPlayerRemoteToFront_t;
typedef struct MusicPlayerWillQuit_t SteamWorks_MusicPlayerWillQuit_t;
typedef struct MusicPlayerWantsPlay_t SteamWorks_MusicPlayerWantsPlay_t;
typedef struct MusicPlayerWantsPause_t SteamWorks_MusicPlayerWantsPause_t;
typedef struct MusicPlayerWantsPlayPrevious_t SteamWorks_MusicPlayerWantsPlayPrevious_t;
typedef struct MusicPlayerWantsPlayNext_t SteamWorks_MusicPlayerWantsPlayNext_t;
typedef struct MusicPlayerWantsShuffled_t SteamWorks_MusicPlayerWantsShuffled_t;
typedef struct MusicPlayerWantsLooped_t SteamWorks_MusicPlayerWantsLooped_t;
typedef struct MusicPlayerWantsVolume_t SteamWorks_MusicPlayerWantsVolume_t;
typedef struct MusicPlayerSelectsQueueEntry_t SteamWorks_MusicPlayerSelectsQueueEntry_t;
typedef struct MusicPlayerSelectsPlaylistEntry_t SteamWorks_MusicPlayerSelectsPlaylistEntry_t;
typedef struct MusicPlayerWantsPlayingRepeatStatus_t SteamWorks_MusicPlayerWantsPlayingRepeatStatus_t;
typedef SteamWorks_uint32 SteamWorks_HTTPRequestHandle;
typedef SteamWorks_uint32 SteamWorks_HTTPCookieContainerHandle;
typedef SteamWorks_uint64 SteamWorks_ClientUnifiedMessageHandle;
typedef SteamWorks_uint64 SteamWorks_ControllerHandle_t;
typedef SteamWorks_uint64 SteamWorks_ControllerActionSetHandle_t;
typedef SteamWorks_uint64 SteamWorks_ControllerDigitalActionHandle_t;
typedef SteamWorks_uint64 SteamWorks_ControllerAnalogActionHandle_t;
typedef SteamWorks_uint64 SteamWorks_UGCQueryHandle_t;
typedef SteamWorks_uint64 SteamWorks_UGCUpdateHandle_t;
typedef struct SteamAppInstalled_t SteamWorks_SteamAppInstalled_t;
typedef struct SteamAppUninstalled_t SteamWorks_SteamAppUninstalled_t;
typedef SteamWorks_uint32 SteamWorks_HHTMLBrowser;
typedef struct HTML_BrowserReady_t SteamWorks_HTML_BrowserReady_t;
typedef struct HTML_NeedsPaint_t SteamWorks_HTML_NeedsPaint_t;
typedef struct HTML_StartRequest_t SteamWorks_HTML_StartRequest_t;
typedef struct HTML_CloseBrowser_t SteamWorks_HTML_CloseBrowser_t;
typedef struct HTML_URLChanged_t SteamWorks_HTML_URLChanged_t;
typedef struct HTML_FinishedRequest_t SteamWorks_HTML_FinishedRequest_t;
typedef struct HTML_OpenLinkInNewTab_t SteamWorks_HTML_OpenLinkInNewTab_t;
typedef struct HTML_ChangedTitle_t SteamWorks_HTML_ChangedTitle_t;
typedef struct HTML_SearchResults_t SteamWorks_HTML_SearchResults_t;
typedef struct HTML_CanGoBackAndForward_t SteamWorks_HTML_CanGoBackAndForward_t;
typedef struct HTML_HorizontalScroll_t SteamWorks_HTML_HorizontalScroll_t;
typedef struct HTML_VerticalScroll_t SteamWorks_HTML_VerticalScroll_t;
typedef struct HTML_LinkAtPosition_t SteamWorks_HTML_LinkAtPosition_t;
typedef struct HTML_JSAlert_t SteamWorks_HTML_JSAlert_t;
typedef struct HTML_JSConfirm_t SteamWorks_HTML_JSConfirm_t;
typedef struct HTML_FileOpenDialog_t SteamWorks_HTML_FileOpenDialog_t;
typedef struct HTML_NewWindow_t SteamWorks_HTML_NewWindow_t;
typedef struct HTML_SetCursor_t SteamWorks_HTML_SetCursor_t;
typedef struct HTML_StatusText_t SteamWorks_HTML_StatusText_t;
typedef struct HTML_ShowToolTip_t SteamWorks_HTML_ShowToolTip_t;
typedef struct HTML_UpdateToolTip_t SteamWorks_HTML_UpdateToolTip_t;
typedef struct HTML_HideToolTip_t SteamWorks_HTML_HideToolTip_t;
typedef SteamWorks_uint64 SteamWorks_SteamItemInstanceID_t;
typedef SteamWorks_int32 SteamWorks_SteamItemDef_t;
typedef SteamWorks_int32 SteamWorks_SteamInventoryResult_t;
typedef struct BroadcastUploadStart_t SteamWorks_BroadcastUploadStart_t;
typedef struct BroadcastUploadStop_t SteamWorks_BroadcastUploadStop_t;
typedef struct GetVideoURLResult_t SteamWorks_GetVideoURLResult_t;
typedef struct GetOPFSettingsResult_t SteamWorks_GetOPFSettingsResult_t;
typedef struct SteamWorks_ISteamClient {} SteamWorks_ISteamClient;
typedef struct SteamWorks_ISteamUser {} SteamWorks_ISteamUser;
typedef struct SteamWorks_ISteamFriends {} SteamWorks_ISteamFriends;
typedef struct SteamWorks_ISteamUtils {} SteamWorks_ISteamUtils;
typedef struct SteamWorks_ISteamMatchmaking {} SteamWorks_ISteamMatchmaking;
typedef struct SteamWorks_ISteamUserStats {} SteamWorks_ISteamUserStats;
typedef struct SteamWorks_ISteamApps {} SteamWorks_ISteamApps;
typedef struct SteamWorks_ISteamMatchmakingServers {} SteamWorks_ISteamMatchmakingServers;
typedef struct SteamWorks_ISteamNetworking {} SteamWorks_ISteamNetworking;
typedef struct SteamWorks_ISteamRemoteStorage {} SteamWorks_ISteamRemoteStorage;
typedef struct SteamWorks_ISteamScreenshots {} SteamWorks_ISteamScreenshots;
typedef struct SteamWorks_ISteamHTTP {} SteamWorks_ISteamHTTP;
typedef struct SteamWorks_ISteamUnifiedMessages {} SteamWorks_ISteamUnifiedMessages;
typedef struct SteamWorks_ISteamController {} SteamWorks_ISteamController;
typedef struct SteamWorks_ISteamUGC {} SteamWorks_ISteamUGC;
typedef struct SteamWorks_ISteamAppList {} SteamWorks_ISteamAppList;
typedef struct SteamWorks_ISteamMusic {} SteamWorks_ISteamMusic;
typedef struct SteamWorks_ISteamMusicRemote {} SteamWorks_ISteamMusicRemote;
typedef struct SteamWorks_ISteamHTMLSurface {} SteamWorks_ISteamHTMLSurface;
typedef struct SteamWorks_ISteamInventory {} SteamWorks_ISteamInventory;
typedef struct SteamWorks_ISteamVideo {} SteamWorks_ISteamVideo;
typedef struct SteamWorks_ISteamGameServer {} SteamWorks_ISteamGameServer;
typedef struct SteamWorks_ISteamGameServerStats {} SteamWorks_ISteamGameServerStats;
typedef struct SteamWorks_ISteamMatchmakingServerListResponse {} SteamWorks_ISteamMatchmakingServerListResponse;
typedef struct SteamWorks_ISteamMatchmakingPlayersResponse {} SteamWorks_ISteamMatchmakingPlayersResponse;
typedef struct SteamWorks_ISteamMatchmakingPingResponse {} SteamWorks_ISteamMatchmakingPingResponse;
typedef struct SteamWorks_ISteamMatchmakingRulesResponse {} SteamWorks_ISteamMatchmakingRulesResponse;
typedef uint64_t SteamWorks_CSteamID;
typedef struct SteamWorks_CGameID {
	SteamWorks_uint64 m_ulGameID;
	struct {
		unsigned int m_nAppID;
		unsigned int m_nType;
		unsigned int m_nModID;
	} m_gameID;
} SteamWorks_CGameID;
typedef struct SteamWorks_ValvePackingSentinel_t {
	SteamWorks_uint32 m_u32;
	SteamWorks_uint64 m_u64;
	SteamWorks_uint16 m_u16;
	double m_d;
} SteamWorks_ValvePackingSentinel_t;
typedef struct SteamWorks_CallbackMsg_t {
	SteamWorks_HSteamUser m_hSteamUser;
	int m_iCallback;
	SteamWorks_uint8 * m_pubParam;
	int m_cubParam;
} SteamWorks_CallbackMsg_t;
typedef struct SteamWorks_SteamServerConnectFailure_t {
	SteamWorks_EResult m_eResult;
	bool m_bStillRetrying;
} SteamWorks_SteamServerConnectFailure_t;
typedef struct SteamWorks_SteamServersDisconnected_t {
	SteamWorks_EResult m_eResult;
} SteamWorks_SteamServersDisconnected_t;
typedef struct SteamWorks_ClientGameServerDeny_t {
	SteamWorks_uint32 m_uAppID;
	SteamWorks_uint32 m_unGameServerIP;
	SteamWorks_uint16 m_usGameServerPort;
	SteamWorks_uint16 m_bSecure;
	SteamWorks_uint32 m_uReason;
} SteamWorks_ClientGameServerDeny_t;
typedef struct SteamWorks_ValidateAuthTicketResponse_t {
	struct {
	} m_SteamID;
	SteamWorks_EAuthSessionResponse m_eAuthSessionResponse;
	struct {
	} m_OwnerSteamID;
} SteamWorks_ValidateAuthTicketResponse_t;
typedef struct SteamWorks_MicroTxnAuthorizationResponse_t {
	SteamWorks_uint32 m_unAppID;
	SteamWorks_uint64 m_ulOrderID;
	SteamWorks_uint8 m_bAuthorized;
} SteamWorks_MicroTxnAuthorizationResponse_t;
typedef struct SteamWorks_EncryptedAppTicketResponse_t {
	SteamWorks_EResult m_eResult;
} SteamWorks_EncryptedAppTicketResponse_t;
typedef struct SteamWorks_GetAuthSessionTicketResponse_t {
	SteamWorks_HAuthTicket m_hAuthTicket;
	SteamWorks_EResult m_eResult;
} SteamWorks_GetAuthSessionTicketResponse_t;
typedef struct SteamWorks_GameWebCallback_t {
	char m_szURL[256];
} SteamWorks_GameWebCallback_t;
typedef struct SteamWorks_StoreAuthURLResponse_t {
	char m_szURL[512];
} SteamWorks_StoreAuthURLResponse_t;
typedef struct SteamWorks_FriendGameInfo_t {
	struct {
	} m_gameID;
	SteamWorks_uint32 m_unGameIP;
	SteamWorks_uint16 m_usGamePort;
	SteamWorks_uint16 m_usQueryPort;
	struct {
	} m_steamIDLobby;
} SteamWorks_FriendGameInfo_t;
typedef struct SteamWorks_FriendSessionStateInfo_t {
	SteamWorks_uint32 m_uiOnlineSessionInstances;
	SteamWorks_uint8 m_uiPublishedToFriendsSessionInstance;
} SteamWorks_FriendSessionStateInfo_t;
typedef struct SteamWorks_PersonaStateChange_t {
	SteamWorks_uint64 m_ulSteamID;
	int m_nChangeFlags;
} SteamWorks_PersonaStateChange_t;
typedef struct SteamWorks_GameOverlayActivated_t {
	SteamWorks_uint8 m_bActive;
} SteamWorks_GameOverlayActivated_t;
typedef struct SteamWorks_GameServerChangeRequested_t {
	char m_rgchServer[64];
	char m_rgchPassword[64];
} SteamWorks_GameServerChangeRequested_t;
typedef struct SteamWorks_GameLobbyJoinRequested_t {
	struct {
	} m_steamIDLobby;
	struct {
	} m_steamIDFriend;
} SteamWorks_GameLobbyJoinRequested_t;
typedef struct SteamWorks_AvatarImageLoaded_t {
	struct {
	} m_steamID;
	int m_iImage;
	int m_iWide;
	int m_iTall;
} SteamWorks_AvatarImageLoaded_t;
typedef struct SteamWorks_ClanOfficerListResponse_t {
	struct {
	} m_steamIDClan;
	int m_cOfficers;
	SteamWorks_uint8 m_bSuccess;
} SteamWorks_ClanOfficerListResponse_t;
typedef struct SteamWorks_FriendRichPresenceUpdate_t {
	struct {
	} m_steamIDFriend;
	SteamWorks_AppId_t m_nAppID;
} SteamWorks_FriendRichPresenceUpdate_t;
typedef struct SteamWorks_GameRichPresenceJoinRequested_t {
	struct {
	} m_steamIDFriend;
	char m_rgchConnect[256];
} SteamWorks_GameRichPresenceJoinRequested_t;
typedef struct SteamWorks_GameConnectedClanChatMsg_t {
	struct {
	} m_steamIDClanChat;
	struct {
	} m_steamIDUser;
	int m_iMessageID;
} SteamWorks_GameConnectedClanChatMsg_t;
typedef struct SteamWorks_GameConnectedChatJoin_t {
	struct {
	} m_steamIDClanChat;
	struct {
	} m_steamIDUser;
} SteamWorks_GameConnectedChatJoin_t;
typedef struct SteamWorks_GameConnectedChatLeave_t {
	struct {
	} m_steamIDClanChat;
	struct {
	} m_steamIDUser;
	bool m_bKicked;
	bool m_bDropped;
} SteamWorks_GameConnectedChatLeave_t;
typedef struct SteamWorks_DownloadClanActivityCountsResult_t {
	bool m_bSuccess;
} SteamWorks_DownloadClanActivityCountsResult_t;
typedef struct SteamWorks_JoinClanChatRoomCompletionResult_t {
	struct {
	} m_steamIDClanChat;
	SteamWorks_EChatRoomEnterResponse m_eChatRoomEnterResponse;
} SteamWorks_JoinClanChatRoomCompletionResult_t;
typedef struct SteamWorks_GameConnectedFriendChatMsg_t {
	struct {
	} m_steamIDUser;
	int m_iMessageID;
} SteamWorks_GameConnectedFriendChatMsg_t;
typedef struct SteamWorks_FriendsGetFollowerCount_t {
	SteamWorks_EResult m_eResult;
	struct {
	} m_steamID;
	int m_nCount;
} SteamWorks_FriendsGetFollowerCount_t;
typedef struct SteamWorks_FriendsIsFollowing_t {
	SteamWorks_EResult m_eResult;
	struct {
	} m_steamID;
	bool m_bIsFollowing;
} SteamWorks_FriendsIsFollowing_t;
typedef struct SteamWorks_FriendsEnumerateFollowingList_t {
	SteamWorks_EResult m_eResult;
	struct {
	} m_rgSteamID[50];
	SteamWorks_int32 m_nResultsReturned;
	SteamWorks_int32 m_nTotalResultCount;
} SteamWorks_FriendsEnumerateFollowingList_t;
typedef struct SteamWorks_SetPersonaNameResponse_t {
	bool m_bSuccess;
	bool m_bLocalSuccess;
	SteamWorks_EResult m_result;
} SteamWorks_SetPersonaNameResponse_t;
typedef struct SteamWorks_LowBatteryPower_t {
	SteamWorks_uint8 m_nMinutesBatteryLeft;
} SteamWorks_LowBatteryPower_t;
typedef struct SteamWorks_SteamAPICallCompleted_t {
	SteamWorks_SteamAPICall_t m_hAsyncCall;
	int m_iCallback;
	SteamWorks_uint32 m_cubParam;
} SteamWorks_SteamAPICallCompleted_t;
typedef struct SteamWorks_CheckFileSignature_t {
	SteamWorks_ECheckFileSignature m_eCheckFileSignature;
} SteamWorks_CheckFileSignature_t;
typedef struct SteamWorks_GamepadTextInputDismissed_t {
	bool m_bSubmitted;
	SteamWorks_uint32 m_unSubmittedText;
} SteamWorks_GamepadTextInputDismissed_t;
typedef struct SteamWorks_MatchMakingKeyValuePair_t {
	char m_szKey[256];
	char m_szValue[256];
} SteamWorks_MatchMakingKeyValuePair_t;
typedef struct SteamWorks_servernetadr_t {
	SteamWorks_uint16 m_usConnectionPort;
	SteamWorks_uint16 m_usQueryPort;
	SteamWorks_uint32 m_unIP;
} SteamWorks_servernetadr_t;
typedef struct SteamWorks_gameserveritem_t {
	struct {
	} m_NetAdr;
	int m_nPing;
	bool m_bHadSuccessfulResponse;
	bool m_bDoNotRefresh;
	char m_szGameDir[32];
	char m_szMap[32];
	char m_szGameDescription[64];
	SteamWorks_uint32 m_nAppID;
	int m_nPlayers;
	int m_nMaxPlayers;
	int m_nBotPlayers;
	bool m_bPassword;
	bool m_bSecure;
	SteamWorks_uint32 m_ulTimeLastPlayed;
	int m_nServerVersion;
	char m_szServerName[64];
	char m_szGameTags[128];
	struct {
	} m_steamID;
} SteamWorks_gameserveritem_t;
typedef struct SteamWorks_FavoritesListChanged_t {
	SteamWorks_uint32 m_nIP;
	SteamWorks_uint32 m_nQueryPort;
	SteamWorks_uint32 m_nConnPort;
	SteamWorks_uint32 m_nAppID;
	SteamWorks_uint32 m_nFlags;
	bool m_bAdd;
	SteamWorks_AccountID_t m_unAccountId;
} SteamWorks_FavoritesListChanged_t;
typedef struct SteamWorks_LobbyInvite_t {
	SteamWorks_uint64 m_ulSteamIDUser;
	SteamWorks_uint64 m_ulSteamIDLobby;
	SteamWorks_uint64 m_ulGameID;
} SteamWorks_LobbyInvite_t;
typedef struct SteamWorks_LobbyEnter_t {
	SteamWorks_uint64 m_ulSteamIDLobby;
	SteamWorks_uint32 m_rgfChatPermissions;
	bool m_bLocked;
	SteamWorks_uint32 m_EChatRoomEnterResponse;
} SteamWorks_LobbyEnter_t;
typedef struct SteamWorks_LobbyDataUpdate_t {
	SteamWorks_uint64 m_ulSteamIDLobby;
	SteamWorks_uint64 m_ulSteamIDMember;
	SteamWorks_uint8 m_bSuccess;
} SteamWorks_LobbyDataUpdate_t;
typedef struct SteamWorks_LobbyChatUpdate_t {
	SteamWorks_uint64 m_ulSteamIDLobby;
	SteamWorks_uint64 m_ulSteamIDUserChanged;
	SteamWorks_uint64 m_ulSteamIDMakingChange;
	SteamWorks_uint32 m_rgfChatMemberStateChange;
} SteamWorks_LobbyChatUpdate_t;
typedef struct SteamWorks_LobbyChatMsg_t {
	SteamWorks_uint64 m_ulSteamIDLobby;
	SteamWorks_uint64 m_ulSteamIDUser;
	SteamWorks_uint8 m_eChatEntryType;
	SteamWorks_uint32 m_iChatID;
} SteamWorks_LobbyChatMsg_t;
typedef struct SteamWorks_LobbyGameCreated_t {
	SteamWorks_uint64 m_ulSteamIDLobby;
	SteamWorks_uint64 m_ulSteamIDGameServer;
	SteamWorks_uint32 m_unIP;
	SteamWorks_uint16 m_usPort;
} SteamWorks_LobbyGameCreated_t;
typedef struct SteamWorks_LobbyMatchList_t {
	SteamWorks_uint32 m_nLobbiesMatching;
} SteamWorks_LobbyMatchList_t;
typedef struct SteamWorks_LobbyKicked_t {
	SteamWorks_uint64 m_ulSteamIDLobby;
	SteamWorks_uint64 m_ulSteamIDAdmin;
	SteamWorks_uint8 m_bKickedDueToDisconnect;
} SteamWorks_LobbyKicked_t;
typedef struct SteamWorks_LobbyCreated_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_uint64 m_ulSteamIDLobby;
} SteamWorks_LobbyCreated_t;
typedef struct SteamWorks_PSNGameBootInviteResult_t {
	bool m_bGameBootInviteExists;
	struct {
	} m_steamIDLobby;
} SteamWorks_PSNGameBootInviteResult_t;
typedef struct SteamWorks_FavoritesListAccountsUpdated_t {
	SteamWorks_EResult m_eResult;
} SteamWorks_FavoritesListAccountsUpdated_t;
typedef struct SteamWorks_SteamParamStringArray_t {
	const char ** m_ppStrings;
	SteamWorks_int32 m_nNumStrings;
} SteamWorks_SteamParamStringArray_t;
typedef struct SteamWorks_RemoteStorageAppSyncedClient_t {
	SteamWorks_AppId_t m_nAppID;
	SteamWorks_EResult m_eResult;
	int m_unNumDownloads;
} SteamWorks_RemoteStorageAppSyncedClient_t;
typedef struct SteamWorks_RemoteStorageAppSyncedServer_t {
	SteamWorks_AppId_t m_nAppID;
	SteamWorks_EResult m_eResult;
	int m_unNumUploads;
} SteamWorks_RemoteStorageAppSyncedServer_t;
typedef struct SteamWorks_RemoteStorageAppSyncProgress_t {
	char m_rgchCurrentFile[260];
	SteamWorks_AppId_t m_nAppID;
	SteamWorks_uint32 m_uBytesTransferredThisChunk;
	double m_dAppPercentComplete;
	bool m_bUploading;
} SteamWorks_RemoteStorageAppSyncProgress_t;
typedef struct SteamWorks_RemoteStorageAppSyncStatusCheck_t {
	SteamWorks_AppId_t m_nAppID;
	SteamWorks_EResult m_eResult;
} SteamWorks_RemoteStorageAppSyncStatusCheck_t;
typedef struct SteamWorks_RemoteStorageFileShareResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_UGCHandle_t m_hFile;
	char m_rgchFilename[260];
} SteamWorks_RemoteStorageFileShareResult_t;
typedef struct SteamWorks_RemoteStoragePublishFileResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	bool m_bUserNeedsToAcceptWorkshopLegalAgreement;
} SteamWorks_RemoteStoragePublishFileResult_t;
typedef struct SteamWorks_RemoteStorageDeletePublishedFileResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
} SteamWorks_RemoteStorageDeletePublishedFileResult_t;
typedef struct SteamWorks_RemoteStorageEnumerateUserPublishedFilesResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_int32 m_nResultsReturned;
	SteamWorks_int32 m_nTotalResultCount;
	SteamWorks_PublishedFileId_t m_rgPublishedFileId[50];
} SteamWorks_RemoteStorageEnumerateUserPublishedFilesResult_t;
typedef struct SteamWorks_RemoteStorageSubscribePublishedFileResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
} SteamWorks_RemoteStorageSubscribePublishedFileResult_t;
typedef struct SteamWorks_RemoteStorageEnumerateUserSubscribedFilesResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_int32 m_nResultsReturned;
	SteamWorks_int32 m_nTotalResultCount;
	SteamWorks_PublishedFileId_t m_rgPublishedFileId[50];
	SteamWorks_uint32 m_rgRTimeSubscribed[50];
} SteamWorks_RemoteStorageEnumerateUserSubscribedFilesResult_t;
typedef struct SteamWorks_RemoteStorageUnsubscribePublishedFileResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
} SteamWorks_RemoteStorageUnsubscribePublishedFileResult_t;
typedef struct SteamWorks_RemoteStorageUpdatePublishedFileResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	bool m_bUserNeedsToAcceptWorkshopLegalAgreement;
} SteamWorks_RemoteStorageUpdatePublishedFileResult_t;
typedef struct SteamWorks_RemoteStorageDownloadUGCResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_UGCHandle_t m_hFile;
	SteamWorks_AppId_t m_nAppID;
	SteamWorks_int32 m_nSizeInBytes;
	char m_pchFileName[260];
	SteamWorks_uint64 m_ulSteamIDOwner;
} SteamWorks_RemoteStorageDownloadUGCResult_t;
typedef struct SteamWorks_RemoteStorageGetPublishedFileDetailsResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_AppId_t m_nCreatorAppID;
	SteamWorks_AppId_t m_nConsumerAppID;
	char m_rgchTitle[129];
	char m_rgchDescription[8000];
	SteamWorks_UGCHandle_t m_hFile;
	SteamWorks_UGCHandle_t m_hPreviewFile;
	SteamWorks_uint64 m_ulSteamIDOwner;
	SteamWorks_uint32 m_rtimeCreated;
	SteamWorks_uint32 m_rtimeUpdated;
	SteamWorks_ERemoteStoragePublishedFileVisibility m_eVisibility;
	bool m_bBanned;
	char m_rgchTags[1025];
	bool m_bTagsTruncated;
	char m_pchFileName[260];
	SteamWorks_int32 m_nFileSize;
	SteamWorks_int32 m_nPreviewFileSize;
	char m_rgchURL[256];
	SteamWorks_EWorkshopFileType m_eFileType;
	bool m_bAcceptedForUse;
} SteamWorks_RemoteStorageGetPublishedFileDetailsResult_t;
typedef struct SteamWorks_RemoteStorageEnumerateWorkshopFilesResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_int32 m_nResultsReturned;
	SteamWorks_int32 m_nTotalResultCount;
	SteamWorks_PublishedFileId_t m_rgPublishedFileId[50];
	float m_rgScore[50];
	SteamWorks_AppId_t m_nAppId;
	SteamWorks_uint32 m_unStartIndex;
} SteamWorks_RemoteStorageEnumerateWorkshopFilesResult_t;
typedef struct SteamWorks_RemoteStorageGetPublishedItemVoteDetailsResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_unPublishedFileId;
	SteamWorks_int32 m_nVotesFor;
	SteamWorks_int32 m_nVotesAgainst;
	SteamWorks_int32 m_nReports;
	float m_fScore;
} SteamWorks_RemoteStorageGetPublishedItemVoteDetailsResult_t;
typedef struct SteamWorks_RemoteStoragePublishedFileSubscribed_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_AppId_t m_nAppID;
} SteamWorks_RemoteStoragePublishedFileSubscribed_t;
typedef struct SteamWorks_RemoteStoragePublishedFileUnsubscribed_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_AppId_t m_nAppID;
} SteamWorks_RemoteStoragePublishedFileUnsubscribed_t;
typedef struct SteamWorks_RemoteStoragePublishedFileDeleted_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_AppId_t m_nAppID;
} SteamWorks_RemoteStoragePublishedFileDeleted_t;
typedef struct SteamWorks_RemoteStorageUpdateUserPublishedItemVoteResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
} SteamWorks_RemoteStorageUpdateUserPublishedItemVoteResult_t;
typedef struct SteamWorks_RemoteStorageUserVoteDetails_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_EWorkshopVote m_eVote;
} SteamWorks_RemoteStorageUserVoteDetails_t;
typedef struct SteamWorks_RemoteStorageEnumerateUserSharedWorkshopFilesResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_int32 m_nResultsReturned;
	SteamWorks_int32 m_nTotalResultCount;
	SteamWorks_PublishedFileId_t m_rgPublishedFileId[50];
} SteamWorks_RemoteStorageEnumerateUserSharedWorkshopFilesResult_t;
typedef struct SteamWorks_RemoteStorageSetUserPublishedFileActionResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_EWorkshopFileAction m_eAction;
} SteamWorks_RemoteStorageSetUserPublishedFileActionResult_t;
typedef struct SteamWorks_RemoteStorageEnumeratePublishedFilesByUserActionResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_EWorkshopFileAction m_eAction;
	SteamWorks_int32 m_nResultsReturned;
	SteamWorks_int32 m_nTotalResultCount;
	SteamWorks_PublishedFileId_t m_rgPublishedFileId[50];
	SteamWorks_uint32 m_rgRTimeUpdated[50];
} SteamWorks_RemoteStorageEnumeratePublishedFilesByUserActionResult_t;
typedef struct SteamWorks_RemoteStoragePublishFileProgress_t {
	double m_dPercentFile;
	bool m_bPreview;
} SteamWorks_RemoteStoragePublishFileProgress_t;
typedef struct SteamWorks_RemoteStoragePublishedFileUpdated_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_AppId_t m_nAppID;
	SteamWorks_uint64 m_ulUnused;
} SteamWorks_RemoteStoragePublishedFileUpdated_t;
typedef struct SteamWorks_RemoteStorageFileWriteAsyncComplete_t {
	SteamWorks_EResult m_eResult;
} SteamWorks_RemoteStorageFileWriteAsyncComplete_t;
typedef struct SteamWorks_RemoteStorageFileReadAsyncComplete_t {
	SteamWorks_SteamAPICall_t m_hFileReadAsync;
	SteamWorks_EResult m_eResult;
	SteamWorks_uint32 m_nOffset;
	SteamWorks_uint32 m_cubRead;
} SteamWorks_RemoteStorageFileReadAsyncComplete_t;
typedef struct SteamWorks_LeaderboardEntry_t {
	struct {
	} m_steamIDUser;
	SteamWorks_int32 m_nGlobalRank;
	SteamWorks_int32 m_nScore;
	SteamWorks_int32 m_cDetails;
	SteamWorks_UGCHandle_t m_hUGC;
} SteamWorks_LeaderboardEntry_t;
typedef struct SteamWorks_UserStatsReceived_t {
	SteamWorks_uint64 m_nGameID;
	SteamWorks_EResult m_eResult;
	struct {
	} m_steamIDUser;
} SteamWorks_UserStatsReceived_t;
typedef struct SteamWorks_UserStatsStored_t {
	SteamWorks_uint64 m_nGameID;
	SteamWorks_EResult m_eResult;
} SteamWorks_UserStatsStored_t;
typedef struct SteamWorks_UserAchievementStored_t {
	SteamWorks_uint64 m_nGameID;
	bool m_bGroupAchievement;
	char m_rgchAchievementName[128];
	SteamWorks_uint32 m_nCurProgress;
	SteamWorks_uint32 m_nMaxProgress;
} SteamWorks_UserAchievementStored_t;
typedef struct SteamWorks_LeaderboardFindResult_t {
	SteamWorks_SteamLeaderboard_t m_hSteamLeaderboard;
	SteamWorks_uint8 m_bLeaderboardFound;
} SteamWorks_LeaderboardFindResult_t;
typedef struct SteamWorks_LeaderboardScoresDownloaded_t {
	SteamWorks_SteamLeaderboard_t m_hSteamLeaderboard;
	SteamWorks_SteamLeaderboardEntries_t m_hSteamLeaderboardEntries;
	int m_cEntryCount;
} SteamWorks_LeaderboardScoresDownloaded_t;
typedef struct SteamWorks_LeaderboardScoreUploaded_t {
	SteamWorks_uint8 m_bSuccess;
	SteamWorks_SteamLeaderboard_t m_hSteamLeaderboard;
	SteamWorks_int32 m_nScore;
	SteamWorks_uint8 m_bScoreChanged;
	int m_nGlobalRankNew;
	int m_nGlobalRankPrevious;
} SteamWorks_LeaderboardScoreUploaded_t;
typedef struct SteamWorks_NumberOfCurrentPlayers_t {
	SteamWorks_uint8 m_bSuccess;
	SteamWorks_int32 m_cPlayers;
} SteamWorks_NumberOfCurrentPlayers_t;
typedef struct SteamWorks_UserStatsUnloaded_t {
	struct {
	} m_steamIDUser;
} SteamWorks_UserStatsUnloaded_t;
typedef struct SteamWorks_UserAchievementIconFetched_t {
	struct {
	} m_nGameID;
	char m_rgchAchievementName[128];
	bool m_bAchieved;
	int m_nIconHandle;
} SteamWorks_UserAchievementIconFetched_t;
typedef struct SteamWorks_GlobalAchievementPercentagesReady_t {
	SteamWorks_uint64 m_nGameID;
	SteamWorks_EResult m_eResult;
} SteamWorks_GlobalAchievementPercentagesReady_t;
typedef struct SteamWorks_LeaderboardUGCSet_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_SteamLeaderboard_t m_hSteamLeaderboard;
} SteamWorks_LeaderboardUGCSet_t;
typedef struct SteamWorks_PS3TrophiesInstalled_t {
	SteamWorks_uint64 m_nGameID;
	SteamWorks_EResult m_eResult;
	SteamWorks_uint64 m_ulRequiredDiskSpace;
} SteamWorks_PS3TrophiesInstalled_t;
typedef struct SteamWorks_GlobalStatsReceived_t {
	SteamWorks_uint64 m_nGameID;
	SteamWorks_EResult m_eResult;
} SteamWorks_GlobalStatsReceived_t;
typedef struct SteamWorks_DlcInstalled_t {
	SteamWorks_AppId_t m_nAppID;
} SteamWorks_DlcInstalled_t;
typedef struct SteamWorks_RegisterActivationCodeResponse_t {
	SteamWorks_ERegisterActivationCodeResult m_eResult;
	SteamWorks_uint32 m_unPackageRegistered;
} SteamWorks_RegisterActivationCodeResponse_t;
typedef struct SteamWorks_AppProofOfPurchaseKeyResponse_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_uint32 m_nAppID;
	SteamWorks_uint32 m_cchKeyLength;
	char m_rgchKey[240];
} SteamWorks_AppProofOfPurchaseKeyResponse_t;
typedef struct SteamWorks_FileDetailsResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_uint64 m_ulFileSize;
	SteamWorks_uint8 m_FileSHA[20];
	SteamWorks_uint32 m_unFlags;
} SteamWorks_FileDetailsResult_t;
typedef struct SteamWorks_P2PSessionState_t {
	SteamWorks_uint8 m_bConnectionActive;
	SteamWorks_uint8 m_bConnecting;
	SteamWorks_uint8 m_eP2PSessionError;
	SteamWorks_uint8 m_bUsingRelay;
	SteamWorks_int32 m_nBytesQueuedForSend;
	SteamWorks_int32 m_nPacketsQueuedForSend;
	SteamWorks_uint32 m_nRemoteIP;
	SteamWorks_uint16 m_nRemotePort;
} SteamWorks_P2PSessionState_t;
typedef struct SteamWorks_P2PSessionRequest_t {
	struct {
	} m_steamIDRemote;
} SteamWorks_P2PSessionRequest_t;
typedef struct SteamWorks_P2PSessionConnectFail_t {
	struct {
	} m_steamIDRemote;
	SteamWorks_uint8 m_eP2PSessionError;
} SteamWorks_P2PSessionConnectFail_t;
typedef struct SteamWorks_SocketStatusCallback_t {
	SteamWorks_SNetSocket_t m_hSocket;
	SteamWorks_SNetListenSocket_t m_hListenSocket;
	struct {
	} m_steamIDRemote;
	int m_eSNetSocketState;
} SteamWorks_SocketStatusCallback_t;
typedef struct SteamWorks_ScreenshotReady_t {
	SteamWorks_ScreenshotHandle m_hLocal;
	SteamWorks_EResult m_eResult;
} SteamWorks_ScreenshotReady_t;
typedef struct SteamWorks_VolumeHasChanged_t {
	float m_flNewVolume;
} SteamWorks_VolumeHasChanged_t;
typedef struct SteamWorks_MusicPlayerWantsShuffled_t {
	bool m_bShuffled;
} SteamWorks_MusicPlayerWantsShuffled_t;
typedef struct SteamWorks_MusicPlayerWantsLooped_t {
	bool m_bLooped;
} SteamWorks_MusicPlayerWantsLooped_t;
typedef struct SteamWorks_MusicPlayerWantsVolume_t {
	float m_flNewVolume;
} SteamWorks_MusicPlayerWantsVolume_t;
typedef struct SteamWorks_MusicPlayerSelectsQueueEntry_t {
	int nID;
} SteamWorks_MusicPlayerSelectsQueueEntry_t;
typedef struct SteamWorks_MusicPlayerSelectsPlaylistEntry_t {
	int nID;
} SteamWorks_MusicPlayerSelectsPlaylistEntry_t;
typedef struct SteamWorks_MusicPlayerWantsPlayingRepeatStatus_t {
	int m_nPlayingRepeatStatus;
} SteamWorks_MusicPlayerWantsPlayingRepeatStatus_t;
typedef struct SteamWorks_HTTPRequestCompleted_t {
	SteamWorks_HTTPRequestHandle m_hRequest;
	SteamWorks_uint64 m_ulContextValue;
	bool m_bRequestSuccessful;
	SteamWorks_EHTTPStatusCode m_eStatusCode;
	SteamWorks_uint32 m_unBodySize;
} SteamWorks_HTTPRequestCompleted_t;
typedef struct SteamWorks_HTTPRequestHeadersReceived_t {
	SteamWorks_HTTPRequestHandle m_hRequest;
	SteamWorks_uint64 m_ulContextValue;
} SteamWorks_HTTPRequestHeadersReceived_t;
typedef struct SteamWorks_HTTPRequestDataReceived_t {
	SteamWorks_HTTPRequestHandle m_hRequest;
	SteamWorks_uint64 m_ulContextValue;
	SteamWorks_uint32 m_cOffset;
	SteamWorks_uint32 m_cBytesReceived;
} SteamWorks_HTTPRequestDataReceived_t;
typedef struct SteamWorks_SteamUnifiedMessagesSendMethodResult_t {
	SteamWorks_ClientUnifiedMessageHandle m_hHandle;
	SteamWorks_uint64 m_unContext;
	SteamWorks_EResult m_eResult;
	SteamWorks_uint32 m_unResponseSize;
} SteamWorks_SteamUnifiedMessagesSendMethodResult_t;
typedef struct SteamWorks_ControllerAnalogActionData_t {
	SteamWorks_EControllerSourceMode eMode;
	float x;
	float y;
	bool bActive;
} SteamWorks_ControllerAnalogActionData_t;
typedef struct SteamWorks_ControllerDigitalActionData_t {
	bool bState;
	bool bActive;
} SteamWorks_ControllerDigitalActionData_t;
typedef struct SteamWorks_ControllerMotionData_t {
	float rotQuatX;
	float rotQuatY;
	float rotQuatZ;
	float rotQuatW;
	float posAccelX;
	float posAccelY;
	float posAccelZ;
	float rotVelX;
	float rotVelY;
	float rotVelZ;
} SteamWorks_ControllerMotionData_t;
typedef struct SteamWorks_SteamUGCDetails_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_EResult m_eResult;
	SteamWorks_EWorkshopFileType m_eFileType;
	SteamWorks_AppId_t m_nCreatorAppID;
	SteamWorks_AppId_t m_nConsumerAppID;
	char m_rgchTitle[129];
	char m_rgchDescription[8000];
	SteamWorks_uint64 m_ulSteamIDOwner;
	SteamWorks_uint32 m_rtimeCreated;
	SteamWorks_uint32 m_rtimeUpdated;
	SteamWorks_uint32 m_rtimeAddedToUserList;
	SteamWorks_ERemoteStoragePublishedFileVisibility m_eVisibility;
	bool m_bBanned;
	bool m_bAcceptedForUse;
	bool m_bTagsTruncated;
	char m_rgchTags[1025];
	SteamWorks_UGCHandle_t m_hFile;
	SteamWorks_UGCHandle_t m_hPreviewFile;
	char m_pchFileName[260];
	SteamWorks_int32 m_nFileSize;
	SteamWorks_int32 m_nPreviewFileSize;
	char m_rgchURL[256];
	SteamWorks_uint32 m_unVotesUp;
	SteamWorks_uint32 m_unVotesDown;
	float m_flScore;
	SteamWorks_uint32 m_unNumChildren;
} SteamWorks_SteamUGCDetails_t;
typedef struct SteamWorks_SteamUGCQueryCompleted_t {
	SteamWorks_UGCQueryHandle_t m_handle;
	SteamWorks_EResult m_eResult;
	SteamWorks_uint32 m_unNumResultsReturned;
	SteamWorks_uint32 m_unTotalMatchingResults;
	bool m_bCachedData;
} SteamWorks_SteamUGCQueryCompleted_t;
typedef struct SteamWorks_SteamUGCRequestUGCDetailsResult_t {
	struct {
	} m_details;
	bool m_bCachedData;
} SteamWorks_SteamUGCRequestUGCDetailsResult_t;
typedef struct SteamWorks_CreateItemResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	bool m_bUserNeedsToAcceptWorkshopLegalAgreement;
} SteamWorks_CreateItemResult_t;
typedef struct SteamWorks_SubmitItemUpdateResult_t {
	SteamWorks_EResult m_eResult;
	bool m_bUserNeedsToAcceptWorkshopLegalAgreement;
} SteamWorks_SubmitItemUpdateResult_t;
typedef struct SteamWorks_DownloadItemResult_t {
	SteamWorks_AppId_t m_unAppID;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_EResult m_eResult;
} SteamWorks_DownloadItemResult_t;
typedef struct SteamWorks_UserFavoriteItemsListChanged_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_EResult m_eResult;
	bool m_bWasAddRequest;
} SteamWorks_UserFavoriteItemsListChanged_t;
typedef struct SteamWorks_SetUserItemVoteResult_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_EResult m_eResult;
	bool m_bVoteUp;
} SteamWorks_SetUserItemVoteResult_t;
typedef struct SteamWorks_GetUserItemVoteResult_t {
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_EResult m_eResult;
	bool m_bVotedUp;
	bool m_bVotedDown;
	bool m_bVoteSkipped;
} SteamWorks_GetUserItemVoteResult_t;
typedef struct SteamWorks_StartPlaytimeTrackingResult_t {
	SteamWorks_EResult m_eResult;
} SteamWorks_StartPlaytimeTrackingResult_t;
typedef struct SteamWorks_StopPlaytimeTrackingResult_t {
	SteamWorks_EResult m_eResult;
} SteamWorks_StopPlaytimeTrackingResult_t;
typedef struct SteamWorks_AddUGCDependencyResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_PublishedFileId_t m_nChildPublishedFileId;
} SteamWorks_AddUGCDependencyResult_t;
typedef struct SteamWorks_RemoveUGCDependencyResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_PublishedFileId_t m_nPublishedFileId;
	SteamWorks_PublishedFileId_t m_nChildPublishedFileId;
} SteamWorks_RemoveUGCDependencyResult_t;
typedef struct SteamWorks_SteamAppInstalled_t {
	SteamWorks_AppId_t m_nAppID;
} SteamWorks_SteamAppInstalled_t;
typedef struct SteamWorks_SteamAppUninstalled_t {
	SteamWorks_AppId_t m_nAppID;
} SteamWorks_SteamAppUninstalled_t;
typedef struct SteamWorks_HTML_BrowserReady_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
} SteamWorks_HTML_BrowserReady_t;
typedef struct SteamWorks_HTML_NeedsPaint_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pBGRA;
	SteamWorks_uint32 unWide;
	SteamWorks_uint32 unTall;
	SteamWorks_uint32 unUpdateX;
	SteamWorks_uint32 unUpdateY;
	SteamWorks_uint32 unUpdateWide;
	SteamWorks_uint32 unUpdateTall;
	SteamWorks_uint32 unScrollX;
	SteamWorks_uint32 unScrollY;
	float flPageScale;
	SteamWorks_uint32 unPageSerial;
} SteamWorks_HTML_NeedsPaint_t;
typedef struct SteamWorks_HTML_StartRequest_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchURL;
	const char * pchTarget;
	const char * pchPostData;
	bool bIsRedirect;
} SteamWorks_HTML_StartRequest_t;
typedef struct SteamWorks_HTML_CloseBrowser_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
} SteamWorks_HTML_CloseBrowser_t;
typedef struct SteamWorks_HTML_URLChanged_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchURL;
	const char * pchPostData;
	bool bIsRedirect;
	const char * pchPageTitle;
	bool bNewNavigation;
} SteamWorks_HTML_URLChanged_t;
typedef struct SteamWorks_HTML_FinishedRequest_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchURL;
	const char * pchPageTitle;
} SteamWorks_HTML_FinishedRequest_t;
typedef struct SteamWorks_HTML_OpenLinkInNewTab_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchURL;
} SteamWorks_HTML_OpenLinkInNewTab_t;
typedef struct SteamWorks_HTML_ChangedTitle_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchTitle;
} SteamWorks_HTML_ChangedTitle_t;
typedef struct SteamWorks_HTML_SearchResults_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	SteamWorks_uint32 unResults;
	SteamWorks_uint32 unCurrentMatch;
} SteamWorks_HTML_SearchResults_t;
typedef struct SteamWorks_HTML_CanGoBackAndForward_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	bool bCanGoBack;
	bool bCanGoForward;
} SteamWorks_HTML_CanGoBackAndForward_t;
typedef struct SteamWorks_HTML_HorizontalScroll_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	SteamWorks_uint32 unScrollMax;
	SteamWorks_uint32 unScrollCurrent;
	float flPageScale;
	bool bVisible;
	SteamWorks_uint32 unPageSize;
} SteamWorks_HTML_HorizontalScroll_t;
typedef struct SteamWorks_HTML_VerticalScroll_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	SteamWorks_uint32 unScrollMax;
	SteamWorks_uint32 unScrollCurrent;
	float flPageScale;
	bool bVisible;
	SteamWorks_uint32 unPageSize;
} SteamWorks_HTML_VerticalScroll_t;
typedef struct SteamWorks_HTML_LinkAtPosition_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	SteamWorks_uint32 x;
	SteamWorks_uint32 y;
	const char * pchURL;
	bool bInput;
	bool bLiveLink;
} SteamWorks_HTML_LinkAtPosition_t;
typedef struct SteamWorks_HTML_JSAlert_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchMessage;
} SteamWorks_HTML_JSAlert_t;
typedef struct SteamWorks_HTML_JSConfirm_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchMessage;
} SteamWorks_HTML_JSConfirm_t;
typedef struct SteamWorks_HTML_FileOpenDialog_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchTitle;
	const char * pchInitialFile;
} SteamWorks_HTML_FileOpenDialog_t;
typedef struct SteamWorks_HTML_NewWindow_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchURL;
	SteamWorks_uint32 unX;
	SteamWorks_uint32 unY;
	SteamWorks_uint32 unWide;
	SteamWorks_uint32 unTall;
	SteamWorks_HHTMLBrowser unNewWindow_BrowserHandle;
} SteamWorks_HTML_NewWindow_t;
typedef struct SteamWorks_HTML_SetCursor_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	SteamWorks_uint32 eMouseCursor;
} SteamWorks_HTML_SetCursor_t;
typedef struct SteamWorks_HTML_StatusText_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchMsg;
} SteamWorks_HTML_StatusText_t;
typedef struct SteamWorks_HTML_ShowToolTip_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchMsg;
} SteamWorks_HTML_ShowToolTip_t;
typedef struct SteamWorks_HTML_UpdateToolTip_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
	const char * pchMsg;
} SteamWorks_HTML_UpdateToolTip_t;
typedef struct SteamWorks_HTML_HideToolTip_t {
	SteamWorks_HHTMLBrowser unBrowserHandle;
} SteamWorks_HTML_HideToolTip_t;
typedef struct SteamWorks_SteamItemDetails_t {
	SteamWorks_SteamItemInstanceID_t m_itemId;
	SteamWorks_SteamItemDef_t m_iDefinition;
	SteamWorks_uint16 m_unQuantity;
	SteamWorks_uint16 m_unFlags;
} SteamWorks_SteamItemDetails_t;
typedef struct SteamWorks_SteamInventoryResultReady_t {
	SteamWorks_SteamInventoryResult_t m_handle;
	SteamWorks_EResult m_result;
} SteamWorks_SteamInventoryResultReady_t;
typedef struct SteamWorks_SteamInventoryFullUpdate_t {
	SteamWorks_SteamInventoryResult_t m_handle;
} SteamWorks_SteamInventoryFullUpdate_t;
typedef struct SteamWorks_SteamInventoryEligiblePromoItemDefIDs_t {
	SteamWorks_EResult m_result;
	struct {
	} m_steamID;
	int m_numEligiblePromoItemDefs;
	bool m_bCachedData;
} SteamWorks_SteamInventoryEligiblePromoItemDefIDs_t;
typedef struct SteamWorks_BroadcastUploadStop_t {
	SteamWorks_EBroadcastUploadResult m_eResult;
} SteamWorks_BroadcastUploadStop_t;
typedef struct SteamWorks_GetVideoURLResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_AppId_t m_unVideoAppID;
	char m_rgchURL[256];
} SteamWorks_GetVideoURLResult_t;
typedef struct SteamWorks_GetOPFSettingsResult_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_AppId_t m_unVideoAppID;
} SteamWorks_GetOPFSettingsResult_t;
typedef struct SteamWorks_GSClientApprove_t {
	struct {
	} m_SteamID;
	struct {
	} m_OwnerSteamID;
} SteamWorks_GSClientApprove_t;
typedef struct SteamWorks_GSClientDeny_t {
	struct {
	} m_SteamID;
	SteamWorks_EDenyReason m_eDenyReason;
	char m_rgchOptionalText[128];
} SteamWorks_GSClientDeny_t;
typedef struct SteamWorks_GSClientKick_t {
	struct {
	} m_SteamID;
	SteamWorks_EDenyReason m_eDenyReason;
} SteamWorks_GSClientKick_t;
typedef struct SteamWorks_GSClientAchievementStatus_t {
	SteamWorks_uint64 m_SteamID;
	char m_pchAchievement[128];
	bool m_bUnlocked;
} SteamWorks_GSClientAchievementStatus_t;
typedef struct SteamWorks_GSPolicyResponse_t {
	SteamWorks_uint8 m_bSecure;
} SteamWorks_GSPolicyResponse_t;
typedef struct SteamWorks_GSGameplayStats_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_int32 m_nRank;
	SteamWorks_uint32 m_unTotalConnects;
	SteamWorks_uint32 m_unTotalMinutesPlayed;
} SteamWorks_GSGameplayStats_t;
typedef struct SteamWorks_GSClientGroupStatus_t {
	struct {
	} m_SteamIDUser;
	struct {
	} m_SteamIDGroup;
	bool m_bMember;
	bool m_bOfficer;
} SteamWorks_GSClientGroupStatus_t;
typedef struct SteamWorks_GSReputation_t {
	SteamWorks_EResult m_eResult;
	SteamWorks_uint32 m_unReputationScore;
	bool m_bBanned;
	SteamWorks_uint32 m_unBannedIP;
	SteamWorks_uint16 m_usBannedPort;
	SteamWorks_uint64 m_ulBannedGameID;
	SteamWorks_uint32 m_unBanExpires;
} SteamWorks_GSReputation_t;
typedef struct SteamWorks_AssociateWithClanResult_t {
	SteamWorks_EResult m_eResult;
} SteamWorks_AssociateWithClanResult_t;
typedef struct SteamWorks_ComputeNewPlayerCompatibilityResult_t {
	SteamWorks_EResult m_eResult;
	int m_cPlayersThatDontLikeCandidate;
	int m_cPlayersThatCandidateDoesntLike;
	int m_cClanPlayersThatDontLikeCandidate;
	struct {
	} m_SteamIDCandidate;
} SteamWorks_ComputeNewPlayerCompatibilityResult_t;
typedef struct SteamWorks_GSStatsReceived_t {
	SteamWorks_EResult m_eResult;
	struct {
	} m_steamIDUser;
} SteamWorks_GSStatsReceived_t;
typedef struct SteamWorks_GSStatsStored_t {
	SteamWorks_EResult m_eResult;
	struct {
	} m_steamIDUser;
} SteamWorks_GSStatsStored_t;
typedef struct SteamWorks_GSStatsUnloaded_t {
	struct {
	} m_steamIDUser;
} SteamWorks_GSStatsUnloaded_t;
SteamWorks_HSteamPipe SteamAPI_ISteamClient_CreateSteamPipe(SteamWorks_ISteamClient* self);
bool SteamAPI_ISteamClient_BReleaseSteamPipe(SteamWorks_ISteamClient* self, SteamWorks_HSteamPipe hSteamPipe);
SteamWorks_HSteamUser SteamAPI_ISteamClient_ConnectToGlobalUser(SteamWorks_ISteamClient* self, SteamWorks_HSteamPipe hSteamPipe);
SteamWorks_HSteamUser SteamAPI_ISteamClient_CreateLocalUser(SteamWorks_ISteamClient* self, SteamWorks_HSteamPipe * phSteamPipe, SteamWorks_EAccountType eAccountType);
void SteamAPI_ISteamClient_ReleaseUser(SteamWorks_ISteamClient* self, SteamWorks_HSteamPipe hSteamPipe, SteamWorks_HSteamUser hUser);
SteamWorks_ISteamUser * SteamAPI_ISteamClient_GetISteamUser(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamGameServer * SteamAPI_ISteamClient_GetISteamGameServer(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
void SteamAPI_ISteamClient_SetLocalIPBinding(SteamWorks_ISteamClient* self, SteamWorks_uint32 unIP, SteamWorks_uint16 usPort);
SteamWorks_ISteamFriends * SteamAPI_ISteamClient_GetISteamFriends(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamUtils * SteamAPI_ISteamClient_GetISteamUtils(SteamWorks_ISteamClient* self, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamMatchmaking * SteamAPI_ISteamClient_GetISteamMatchmaking(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamMatchmakingServers * SteamAPI_ISteamClient_GetISteamMatchmakingServers(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
void * SteamAPI_ISteamClient_GetISteamGenericInterface(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamUserStats * SteamAPI_ISteamClient_GetISteamUserStats(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamGameServerStats * SteamAPI_ISteamClient_GetISteamGameServerStats(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamApps * SteamAPI_ISteamClient_GetISteamApps(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamNetworking * SteamAPI_ISteamClient_GetISteamNetworking(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamRemoteStorage * SteamAPI_ISteamClient_GetISteamRemoteStorage(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamScreenshots * SteamAPI_ISteamClient_GetISteamScreenshots(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_uint32 SteamAPI_ISteamClient_GetIPCCallCount(SteamWorks_ISteamClient* self);
void SteamAPI_ISteamClient_SetWarningMessageHook(SteamWorks_ISteamClient* self, SteamWorks_SteamAPIWarningMessageHook_t pFunction);
bool SteamAPI_ISteamClient_BShutdownIfAllPipesClosed(SteamWorks_ISteamClient* self);
SteamWorks_ISteamHTTP * SteamAPI_ISteamClient_GetISteamHTTP(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamUnifiedMessages * SteamAPI_ISteamClient_GetISteamUnifiedMessages(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamController * SteamAPI_ISteamClient_GetISteamController(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamUGC * SteamAPI_ISteamClient_GetISteamUGC(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamAppList * SteamAPI_ISteamClient_GetISteamAppList(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamUser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamMusic * SteamAPI_ISteamClient_GetISteamMusic(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamMusicRemote * SteamAPI_ISteamClient_GetISteamMusicRemote(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamHTMLSurface * SteamAPI_ISteamClient_GetISteamHTMLSurface(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamInventory * SteamAPI_ISteamClient_GetISteamInventory(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_ISteamVideo * SteamAPI_ISteamClient_GetISteamVideo(SteamWorks_ISteamClient* self, SteamWorks_HSteamUser hSteamuser, SteamWorks_HSteamPipe hSteamPipe, const char * pchVersion);
SteamWorks_HSteamUser SteamAPI_ISteamUser_GetHSteamUser(SteamWorks_ISteamUser* self);
bool SteamAPI_ISteamUser_BLoggedOn(SteamWorks_ISteamUser* self);
SteamWorks_CSteamID SteamAPI_ISteamUser_GetSteamID(SteamWorks_ISteamUser* self);
int SteamAPI_ISteamUser_InitiateGameConnection(SteamWorks_ISteamUser* self, void * pAuthBlob, int cbMaxAuthBlob, SteamWorks_CSteamID steamIDGameServer, SteamWorks_uint32 unIPServer, SteamWorks_uint16 usPortServer, bool bSecure);
void SteamAPI_ISteamUser_TerminateGameConnection(SteamWorks_ISteamUser* self, SteamWorks_uint32 unIPServer, SteamWorks_uint16 usPortServer);
void SteamAPI_ISteamUser_TrackAppUsageEvent(SteamWorks_ISteamUser* self, SteamWorks_CGameID gameID, int eAppUsageEvent, const char * pchExtraInfo);
bool SteamAPI_ISteamUser_GetUserDataFolder(SteamWorks_ISteamUser* self, char * pchBuffer, int cubBuffer);
void SteamAPI_ISteamUser_StartVoiceRecording(SteamWorks_ISteamUser* self);
void SteamAPI_ISteamUser_StopVoiceRecording(SteamWorks_ISteamUser* self);
SteamWorks_EVoiceResult SteamAPI_ISteamUser_GetAvailableVoice(SteamWorks_ISteamUser* self, SteamWorks_uint32 * pcbCompressed, SteamWorks_uint32 * pcbUncompressed_Deprecated, SteamWorks_uint32 nUncompressedVoiceDesiredSampleRate_Deprecated);
SteamWorks_EVoiceResult SteamAPI_ISteamUser_GetVoice(SteamWorks_ISteamUser* self, bool bWantCompressed, void * pDestBuffer, SteamWorks_uint32 cbDestBufferSize, SteamWorks_uint32 * nBytesWritten, bool bWantUncompressed_Deprecated, void * pUncompressedDestBuffer_Deprecated, SteamWorks_uint32 cbUncompressedDestBufferSize_Deprecated, SteamWorks_uint32 * nUncompressBytesWritten_Deprecated, SteamWorks_uint32 nUncompressedVoiceDesiredSampleRate_Deprecated);
SteamWorks_EVoiceResult SteamAPI_ISteamUser_DecompressVoice(SteamWorks_ISteamUser* self, void * pCompressed, SteamWorks_uint32 cbCompressed, void * pDestBuffer, SteamWorks_uint32 cbDestBufferSize, SteamWorks_uint32 * nBytesWritten, SteamWorks_uint32 nDesiredSampleRate);
SteamWorks_uint32 SteamAPI_ISteamUser_GetVoiceOptimalSampleRate(SteamWorks_ISteamUser* self);
SteamWorks_HAuthTicket SteamAPI_ISteamUser_GetAuthSessionTicket(SteamWorks_ISteamUser* self, void * pTicket, int cbMaxTicket, SteamWorks_uint32 * pcbTicket);
SteamWorks_EBeginAuthSessionResult SteamAPI_ISteamUser_BeginAuthSession(SteamWorks_ISteamUser* self, void * pAuthTicket, int cbAuthTicket, SteamWorks_CSteamID steamID);
void SteamAPI_ISteamUser_EndAuthSession(SteamWorks_ISteamUser* self, SteamWorks_CSteamID steamID);
void SteamAPI_ISteamUser_CancelAuthTicket(SteamWorks_ISteamUser* self, SteamWorks_HAuthTicket hAuthTicket);
SteamWorks_EUserHasLicenseForAppResult SteamAPI_ISteamUser_UserHasLicenseForApp(SteamWorks_ISteamUser* self, SteamWorks_CSteamID steamID, SteamWorks_AppId_t appID);
bool SteamAPI_ISteamUser_BIsBehindNAT(SteamWorks_ISteamUser* self);
void SteamAPI_ISteamUser_AdvertiseGame(SteamWorks_ISteamUser* self, SteamWorks_CSteamID steamIDGameServer, SteamWorks_uint32 unIPServer, SteamWorks_uint16 usPortServer);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUser_RequestEncryptedAppTicket(SteamWorks_ISteamUser* self, void * pDataToInclude, int cbDataToInclude);
bool SteamAPI_ISteamUser_GetEncryptedAppTicket(SteamWorks_ISteamUser* self, void * pTicket, int cbMaxTicket, SteamWorks_uint32 * pcbTicket);
int SteamAPI_ISteamUser_GetGameBadgeLevel(SteamWorks_ISteamUser* self, int nSeries, bool bFoil);
int SteamAPI_ISteamUser_GetPlayerSteamLevel(SteamWorks_ISteamUser* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUser_RequestStoreAuthURL(SteamWorks_ISteamUser* self, const char * pchRedirectURL);
bool SteamAPI_ISteamUser_BIsPhoneVerified(SteamWorks_ISteamUser* self);
bool SteamAPI_ISteamUser_BIsTwoFactorEnabled(SteamWorks_ISteamUser* self);
bool SteamAPI_ISteamUser_BIsPhoneIdentifying(SteamWorks_ISteamUser* self);
bool SteamAPI_ISteamUser_BIsPhoneRequiringVerification(SteamWorks_ISteamUser* self);
const char * SteamAPI_ISteamFriends_GetPersonaName(SteamWorks_ISteamFriends* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamFriends_SetPersonaName(SteamWorks_ISteamFriends* self, const char * pchPersonaName);
SteamWorks_EPersonaState SteamAPI_ISteamFriends_GetPersonaState(SteamWorks_ISteamFriends* self);
int SteamAPI_ISteamFriends_GetFriendCount(SteamWorks_ISteamFriends* self, int iFriendFlags);
SteamWorks_CSteamID SteamAPI_ISteamFriends_GetFriendByIndex(SteamWorks_ISteamFriends* self, int iFriend, int iFriendFlags);
SteamWorks_EFriendRelationship SteamAPI_ISteamFriends_GetFriendRelationship(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
SteamWorks_EPersonaState SteamAPI_ISteamFriends_GetFriendPersonaState(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
const char * SteamAPI_ISteamFriends_GetFriendPersonaName(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
bool SteamAPI_ISteamFriends_GetFriendGamePlayed(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, SteamWorks_FriendGameInfo_t * pFriendGameInfo);
const char * SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, int iPersonaName);
int SteamAPI_ISteamFriends_GetFriendSteamLevel(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
const char * SteamAPI_ISteamFriends_GetPlayerNickname(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDPlayer);
int SteamAPI_ISteamFriends_GetFriendsGroupCount(SteamWorks_ISteamFriends* self);
SteamWorks_FriendsGroupID_t SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(SteamWorks_ISteamFriends* self, int iFG);
const char * SteamAPI_ISteamFriends_GetFriendsGroupName(SteamWorks_ISteamFriends* self, SteamWorks_FriendsGroupID_t friendsGroupID);
int SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(SteamWorks_ISteamFriends* self, SteamWorks_FriendsGroupID_t friendsGroupID);
void SteamAPI_ISteamFriends_GetFriendsGroupMembersList(SteamWorks_ISteamFriends* self, SteamWorks_FriendsGroupID_t friendsGroupID, SteamWorks_CSteamID * pOutSteamIDMembers, int nMembersCount);
bool SteamAPI_ISteamFriends_HasFriend(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, int iFriendFlags);
int SteamAPI_ISteamFriends_GetClanCount(SteamWorks_ISteamFriends* self);
SteamWorks_CSteamID SteamAPI_ISteamFriends_GetClanByIndex(SteamWorks_ISteamFriends* self, int iClan);
const char * SteamAPI_ISteamFriends_GetClanName(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
const char * SteamAPI_ISteamFriends_GetClanTag(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
bool SteamAPI_ISteamFriends_GetClanActivityCounts(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan, int * pnOnline, int * pnInGame, int * pnChatting);
SteamWorks_SteamAPICall_t SteamAPI_ISteamFriends_DownloadClanActivityCounts(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID * psteamIDClans, int cClansToRequest);
int SteamAPI_ISteamFriends_GetFriendCountFromSource(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDSource);
SteamWorks_CSteamID SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDSource, int iFriend);
bool SteamAPI_ISteamFriends_IsUserInSource(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDUser, SteamWorks_CSteamID steamIDSource);
void SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDUser, bool bSpeaking);
void SteamAPI_ISteamFriends_ActivateGameOverlay(SteamWorks_ISteamFriends* self, const char * pchDialog);
void SteamAPI_ISteamFriends_ActivateGameOverlayToUser(SteamWorks_ISteamFriends* self, const char * pchDialog, SteamWorks_CSteamID steamID);
void SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(SteamWorks_ISteamFriends* self, const char * pchURL);
void SteamAPI_ISteamFriends_ActivateGameOverlayToStore(SteamWorks_ISteamFriends* self, SteamWorks_AppId_t nAppID, SteamWorks_EOverlayToStoreFlag eFlag);
void SteamAPI_ISteamFriends_SetPlayedWith(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDUserPlayedWith);
void SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDLobby);
int SteamAPI_ISteamFriends_GetSmallFriendAvatar(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
int SteamAPI_ISteamFriends_GetMediumFriendAvatar(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
int SteamAPI_ISteamFriends_GetLargeFriendAvatar(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
bool SteamAPI_ISteamFriends_RequestUserInformation(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDUser, bool bRequireNameOnly);
SteamWorks_SteamAPICall_t SteamAPI_ISteamFriends_RequestClanOfficerList(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
SteamWorks_CSteamID SteamAPI_ISteamFriends_GetClanOwner(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
int SteamAPI_ISteamFriends_GetClanOfficerCount(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
SteamWorks_CSteamID SteamAPI_ISteamFriends_GetClanOfficerByIndex(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan, int iOfficer);
SteamWorks_uint32 SteamAPI_ISteamFriends_GetUserRestrictions(SteamWorks_ISteamFriends* self);
bool SteamAPI_ISteamFriends_SetRichPresence(SteamWorks_ISteamFriends* self, const char * pchKey, const char * pchValue);
void SteamAPI_ISteamFriends_ClearRichPresence(SteamWorks_ISteamFriends* self);
const char * SteamAPI_ISteamFriends_GetFriendRichPresence(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, const char * pchKey);
int SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
const char * SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, int iKey);
void SteamAPI_ISteamFriends_RequestFriendRichPresence(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
bool SteamAPI_ISteamFriends_InviteUserToGame(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, const char * pchConnectString);
int SteamAPI_ISteamFriends_GetCoplayFriendCount(SteamWorks_ISteamFriends* self);
SteamWorks_CSteamID SteamAPI_ISteamFriends_GetCoplayFriend(SteamWorks_ISteamFriends* self, int iCoplayFriend);
int SteamAPI_ISteamFriends_GetFriendCoplayTime(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
SteamWorks_AppId_t SteamAPI_ISteamFriends_GetFriendCoplayGame(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend);
SteamWorks_SteamAPICall_t SteamAPI_ISteamFriends_JoinClanChatRoom(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
bool SteamAPI_ISteamFriends_LeaveClanChatRoom(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
int SteamAPI_ISteamFriends_GetClanChatMemberCount(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan);
SteamWorks_CSteamID SteamAPI_ISteamFriends_GetChatMemberByIndex(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClan, int iUser);
bool SteamAPI_ISteamFriends_SendClanChatMessage(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClanChat, const char * pchText);
int SteamAPI_ISteamFriends_GetClanChatMessage(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClanChat, int iMessage, void * prgchText, int cchTextMax, SteamWorks_EChatEntryType * peChatEntryType, SteamWorks_CSteamID * psteamidChatter);
bool SteamAPI_ISteamFriends_IsClanChatAdmin(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClanChat, SteamWorks_CSteamID steamIDUser);
bool SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClanChat);
bool SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClanChat);
bool SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDClanChat);
bool SteamAPI_ISteamFriends_SetListenForFriendsMessages(SteamWorks_ISteamFriends* self, bool bInterceptEnabled);
bool SteamAPI_ISteamFriends_ReplyToFriendMessage(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, const char * pchMsgToSend);
int SteamAPI_ISteamFriends_GetFriendMessage(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamIDFriend, int iMessageID, void * pvData, int cubData, SteamWorks_EChatEntryType * peChatEntryType);
SteamWorks_SteamAPICall_t SteamAPI_ISteamFriends_GetFollowerCount(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamID);
SteamWorks_SteamAPICall_t SteamAPI_ISteamFriends_IsFollowing(SteamWorks_ISteamFriends* self, SteamWorks_CSteamID steamID);
SteamWorks_SteamAPICall_t SteamAPI_ISteamFriends_EnumerateFollowingList(SteamWorks_ISteamFriends* self, SteamWorks_uint32 unStartIndex);
SteamWorks_uint32 SteamAPI_ISteamUtils_GetSecondsSinceAppActive(SteamWorks_ISteamUtils* self);
SteamWorks_uint32 SteamAPI_ISteamUtils_GetSecondsSinceComputerActive(SteamWorks_ISteamUtils* self);
SteamWorks_EUniverse SteamAPI_ISteamUtils_GetConnectedUniverse(SteamWorks_ISteamUtils* self);
SteamWorks_uint32 SteamAPI_ISteamUtils_GetServerRealTime(SteamWorks_ISteamUtils* self);
const char * SteamAPI_ISteamUtils_GetIPCountry(SteamWorks_ISteamUtils* self);
bool SteamAPI_ISteamUtils_GetImageSize(SteamWorks_ISteamUtils* self, int iImage, SteamWorks_uint32 * pnWidth, SteamWorks_uint32 * pnHeight);
bool SteamAPI_ISteamUtils_GetImageRGBA(SteamWorks_ISteamUtils* self, int iImage, SteamWorks_uint8 * pubDest, int nDestBufferSize);
bool SteamAPI_ISteamUtils_GetCSERIPPort(SteamWorks_ISteamUtils* self, SteamWorks_uint32 * unIP, SteamWorks_uint16 * usPort);
SteamWorks_uint8 SteamAPI_ISteamUtils_GetCurrentBatteryPower(SteamWorks_ISteamUtils* self);
SteamWorks_uint32 SteamAPI_ISteamUtils_GetAppID(SteamWorks_ISteamUtils* self);
void SteamAPI_ISteamUtils_SetOverlayNotificationPosition(SteamWorks_ISteamUtils* self, SteamWorks_ENotificationPosition eNotificationPosition);
bool SteamAPI_ISteamUtils_IsAPICallCompleted(SteamWorks_ISteamUtils* self, SteamWorks_SteamAPICall_t hSteamAPICall, bool * pbFailed);
SteamWorks_ESteamAPICallFailure SteamAPI_ISteamUtils_GetAPICallFailureReason(SteamWorks_ISteamUtils* self, SteamWorks_SteamAPICall_t hSteamAPICall);
bool SteamAPI_ISteamUtils_GetAPICallResult(SteamWorks_ISteamUtils* self, SteamWorks_SteamAPICall_t hSteamAPICall, void * pCallback, int cubCallback, int iCallbackExpected, bool * pbFailed);
SteamWorks_uint32 SteamAPI_ISteamUtils_GetIPCCallCount(SteamWorks_ISteamUtils* self);
void SteamAPI_ISteamUtils_SetWarningMessageHook(SteamWorks_ISteamUtils* self, SteamWorks_SteamAPIWarningMessageHook_t pFunction);
bool SteamAPI_ISteamUtils_IsOverlayEnabled(SteamWorks_ISteamUtils* self);
bool SteamAPI_ISteamUtils_BOverlayNeedsPresent(SteamWorks_ISteamUtils* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUtils_CheckFileSignature(SteamWorks_ISteamUtils* self, const char * szFileName);
bool SteamAPI_ISteamUtils_ShowGamepadTextInput(SteamWorks_ISteamUtils* self, SteamWorks_EGamepadTextInputMode eInputMode, SteamWorks_EGamepadTextInputLineMode eLineInputMode, const char * pchDescription, SteamWorks_uint32 unCharMax, const char * pchExistingText);
SteamWorks_uint32 SteamAPI_ISteamUtils_GetEnteredGamepadTextLength(SteamWorks_ISteamUtils* self);
bool SteamAPI_ISteamUtils_GetEnteredGamepadTextInput(SteamWorks_ISteamUtils* self, char * pchText, SteamWorks_uint32 cchText);
const char * SteamAPI_ISteamUtils_GetSteamUILanguage(SteamWorks_ISteamUtils* self);
bool SteamAPI_ISteamUtils_IsSteamRunningInVR(SteamWorks_ISteamUtils* self);
void SteamAPI_ISteamUtils_SetOverlayNotificationInset(SteamWorks_ISteamUtils* self, int nHorizontalInset, int nVerticalInset);
bool SteamAPI_ISteamUtils_IsSteamInBigPictureMode(SteamWorks_ISteamUtils* self);
void SteamAPI_ISteamUtils_StartVRDashboard(SteamWorks_ISteamUtils* self);
bool SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled(SteamWorks_ISteamUtils* self);
void SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled(SteamWorks_ISteamUtils* self, bool bEnabled);
int SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(SteamWorks_ISteamMatchmaking* self);
bool SteamAPI_ISteamMatchmaking_GetFavoriteGame(SteamWorks_ISteamMatchmaking* self, int iGame, SteamWorks_AppId_t * pnAppID, SteamWorks_uint32 * pnIP, SteamWorks_uint16 * pnConnPort, SteamWorks_uint16 * pnQueryPort, SteamWorks_uint32 * punFlags, SteamWorks_uint32 * pRTime32LastPlayedOnServer);
int SteamAPI_ISteamMatchmaking_AddFavoriteGame(SteamWorks_ISteamMatchmaking* self, SteamWorks_AppId_t nAppID, SteamWorks_uint32 nIP, SteamWorks_uint16 nConnPort, SteamWorks_uint16 nQueryPort, SteamWorks_uint32 unFlags, SteamWorks_uint32 rTime32LastPlayedOnServer);
bool SteamAPI_ISteamMatchmaking_RemoveFavoriteGame(SteamWorks_ISteamMatchmaking* self, SteamWorks_AppId_t nAppID, SteamWorks_uint32 nIP, SteamWorks_uint16 nConnPort, SteamWorks_uint16 nQueryPort, SteamWorks_uint32 unFlags);
SteamWorks_SteamAPICall_t SteamAPI_ISteamMatchmaking_RequestLobbyList(SteamWorks_ISteamMatchmaking* self);
void SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter(SteamWorks_ISteamMatchmaking* self, const char * pchKeyToMatch, const char * pchValueToMatch, SteamWorks_ELobbyComparison eComparisonType);
void SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter(SteamWorks_ISteamMatchmaking* self, const char * pchKeyToMatch, int nValueToMatch, SteamWorks_ELobbyComparison eComparisonType);
void SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter(SteamWorks_ISteamMatchmaking* self, const char * pchKeyToMatch, int nValueToBeCloseTo);
void SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(SteamWorks_ISteamMatchmaking* self, int nSlotsAvailable);
void SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter(SteamWorks_ISteamMatchmaking* self, SteamWorks_ELobbyDistanceFilter eLobbyDistanceFilter);
void SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter(SteamWorks_ISteamMatchmaking* self, int cMaxResults);
void SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
SteamWorks_CSteamID SteamAPI_ISteamMatchmaking_GetLobbyByIndex(SteamWorks_ISteamMatchmaking* self, int iLobby);
SteamWorks_SteamAPICall_t SteamAPI_ISteamMatchmaking_CreateLobby(SteamWorks_ISteamMatchmaking* self, SteamWorks_ELobbyType eLobbyType, int cMaxMembers);
SteamWorks_SteamAPICall_t SteamAPI_ISteamMatchmaking_JoinLobby(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
void SteamAPI_ISteamMatchmaking_LeaveLobby(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
bool SteamAPI_ISteamMatchmaking_InviteUserToLobby(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, SteamWorks_CSteamID steamIDInvitee);
int SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
SteamWorks_CSteamID SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, int iMember);
const char * SteamAPI_ISteamMatchmaking_GetLobbyData(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, const char * pchKey);
bool SteamAPI_ISteamMatchmaking_SetLobbyData(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, const char * pchKey, const char * pchValue);
int SteamAPI_ISteamMatchmaking_GetLobbyDataCount(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
bool SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, int iLobbyData, char * pchKey, int cchKeyBufferSize, char * pchValue, int cchValueBufferSize);
bool SteamAPI_ISteamMatchmaking_DeleteLobbyData(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, const char * pchKey);
const char * SteamAPI_ISteamMatchmaking_GetLobbyMemberData(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, SteamWorks_CSteamID steamIDUser, const char * pchKey);
void SteamAPI_ISteamMatchmaking_SetLobbyMemberData(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, const char * pchKey, const char * pchValue);
bool SteamAPI_ISteamMatchmaking_SendLobbyChatMsg(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, void * pvMsgBody, int cubMsgBody);
int SteamAPI_ISteamMatchmaking_GetLobbyChatEntry(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, int iChatID, SteamWorks_CSteamID * pSteamIDUser, void * pvData, int cubData, SteamWorks_EChatEntryType * peChatEntryType);
bool SteamAPI_ISteamMatchmaking_RequestLobbyData(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
void SteamAPI_ISteamMatchmaking_SetLobbyGameServer(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, SteamWorks_uint32 unGameServerIP, SteamWorks_uint16 unGameServerPort, SteamWorks_CSteamID steamIDGameServer);
bool SteamAPI_ISteamMatchmaking_GetLobbyGameServer(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, SteamWorks_uint32 * punGameServerIP, SteamWorks_uint16 * punGameServerPort, SteamWorks_CSteamID * psteamIDGameServer);
bool SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, int cMaxMembers);
int SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
bool SteamAPI_ISteamMatchmaking_SetLobbyType(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, SteamWorks_ELobbyType eLobbyType);
bool SteamAPI_ISteamMatchmaking_SetLobbyJoinable(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, bool bLobbyJoinable);
SteamWorks_CSteamID SteamAPI_ISteamMatchmaking_GetLobbyOwner(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby);
bool SteamAPI_ISteamMatchmaking_SetLobbyOwner(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, SteamWorks_CSteamID steamIDNewOwner);
bool SteamAPI_ISteamMatchmaking_SetLinkedLobby(SteamWorks_ISteamMatchmaking* self, SteamWorks_CSteamID steamIDLobby, SteamWorks_CSteamID steamIDLobbyDependent);
void SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded(SteamWorks_ISteamMatchmakingServerListResponse* self, SteamWorks_HServerListRequest hRequest, int iServer);
void SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond(SteamWorks_ISteamMatchmakingServerListResponse* self, SteamWorks_HServerListRequest hRequest, int iServer);
void SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete(SteamWorks_ISteamMatchmakingServerListResponse* self, SteamWorks_HServerListRequest hRequest, SteamWorks_EMatchMakingServerResponse response);
void SteamAPI_ISteamMatchmakingPingResponse_ServerResponded(SteamWorks_ISteamMatchmakingPingResponse* self, SteamWorks_gameserveritem_t * server);
void SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond(SteamWorks_ISteamMatchmakingPingResponse* self);
void SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList(SteamWorks_ISteamMatchmakingPlayersResponse* self, const char * pchName, int nScore, float flTimePlayed);
void SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond(SteamWorks_ISteamMatchmakingPlayersResponse* self);
void SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete(SteamWorks_ISteamMatchmakingPlayersResponse* self);
void SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded(SteamWorks_ISteamMatchmakingRulesResponse* self, const char * pchRule, const char * pchValue);
void SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond(SteamWorks_ISteamMatchmakingRulesResponse* self);
void SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete(SteamWorks_ISteamMatchmakingRulesResponse* self);
SteamWorks_HServerListRequest SteamAPI_ISteamMatchmakingServers_RequestInternetServerList(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_AppId_t iApp, SteamWorks_MatchMakingKeyValuePair_t ** ppchFilters, SteamWorks_uint32 nFilters, SteamWorks_ISteamMatchmakingServerListResponse * pRequestServersResponse);
SteamWorks_HServerListRequest SteamAPI_ISteamMatchmakingServers_RequestLANServerList(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_AppId_t iApp, SteamWorks_ISteamMatchmakingServerListResponse * pRequestServersResponse);
SteamWorks_HServerListRequest SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_AppId_t iApp, SteamWorks_MatchMakingKeyValuePair_t ** ppchFilters, SteamWorks_uint32 nFilters, SteamWorks_ISteamMatchmakingServerListResponse * pRequestServersResponse);
SteamWorks_HServerListRequest SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_AppId_t iApp, SteamWorks_MatchMakingKeyValuePair_t ** ppchFilters, SteamWorks_uint32 nFilters, SteamWorks_ISteamMatchmakingServerListResponse * pRequestServersResponse);
SteamWorks_HServerListRequest SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_AppId_t iApp, SteamWorks_MatchMakingKeyValuePair_t ** ppchFilters, SteamWorks_uint32 nFilters, SteamWorks_ISteamMatchmakingServerListResponse * pRequestServersResponse);
SteamWorks_HServerListRequest SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_AppId_t iApp, SteamWorks_MatchMakingKeyValuePair_t ** ppchFilters, SteamWorks_uint32 nFilters, SteamWorks_ISteamMatchmakingServerListResponse * pRequestServersResponse);
void SteamAPI_ISteamMatchmakingServers_ReleaseRequest(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerListRequest hServerListRequest);
SteamWorks_gameserveritem_t * SteamAPI_ISteamMatchmakingServers_GetServerDetails(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerListRequest hRequest, int iServer);
void SteamAPI_ISteamMatchmakingServers_CancelQuery(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerListRequest hRequest);
void SteamAPI_ISteamMatchmakingServers_RefreshQuery(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerListRequest hRequest);
bool SteamAPI_ISteamMatchmakingServers_IsRefreshing(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerListRequest hRequest);
int SteamAPI_ISteamMatchmakingServers_GetServerCount(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerListRequest hRequest);
void SteamAPI_ISteamMatchmakingServers_RefreshServer(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerListRequest hRequest, int iServer);
SteamWorks_HServerQuery SteamAPI_ISteamMatchmakingServers_PingServer(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_uint32 unIP, SteamWorks_uint16 usPort, SteamWorks_ISteamMatchmakingPingResponse * pRequestServersResponse);
SteamWorks_HServerQuery SteamAPI_ISteamMatchmakingServers_PlayerDetails(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_uint32 unIP, SteamWorks_uint16 usPort, SteamWorks_ISteamMatchmakingPlayersResponse * pRequestServersResponse);
SteamWorks_HServerQuery SteamAPI_ISteamMatchmakingServers_ServerRules(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_uint32 unIP, SteamWorks_uint16 usPort, SteamWorks_ISteamMatchmakingRulesResponse * pRequestServersResponse);
void SteamAPI_ISteamMatchmakingServers_CancelServerQuery(SteamWorks_ISteamMatchmakingServers* self, SteamWorks_HServerQuery hServerQuery);
bool SteamAPI_ISteamRemoteStorage_FileWrite(SteamWorks_ISteamRemoteStorage* self, const char * pchFile, void * pvData, SteamWorks_int32 cubData);
SteamWorks_int32 SteamAPI_ISteamRemoteStorage_FileRead(SteamWorks_ISteamRemoteStorage* self, const char * pchFile, void * pvData, SteamWorks_int32 cubDataToRead);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_FileWriteAsync(SteamWorks_ISteamRemoteStorage* self, const char * pchFile, void * pvData, SteamWorks_uint32 cubData);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_FileReadAsync(SteamWorks_ISteamRemoteStorage* self, const char * pchFile, SteamWorks_uint32 nOffset, SteamWorks_uint32 cubToRead);
bool SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete(SteamWorks_ISteamRemoteStorage* self, SteamWorks_SteamAPICall_t hReadCall, void * pvBuffer, SteamWorks_uint32 cubToRead);
bool SteamAPI_ISteamRemoteStorage_FileForget(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
bool SteamAPI_ISteamRemoteStorage_FileDelete(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_FileShare(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
bool SteamAPI_ISteamRemoteStorage_SetSyncPlatforms(SteamWorks_ISteamRemoteStorage* self, const char * pchFile, SteamWorks_ERemoteStoragePlatform eRemoteStoragePlatform);
SteamWorks_UGCFileWriteStreamHandle_t SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
bool SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCFileWriteStreamHandle_t writeHandle, void * pvData, SteamWorks_int32 cubData);
bool SteamAPI_ISteamRemoteStorage_FileWriteStreamClose(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCFileWriteStreamHandle_t writeHandle);
bool SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCFileWriteStreamHandle_t writeHandle);
bool SteamAPI_ISteamRemoteStorage_FileExists(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
bool SteamAPI_ISteamRemoteStorage_FilePersisted(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
SteamWorks_int32 SteamAPI_ISteamRemoteStorage_GetFileSize(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
SteamWorks_int64 SteamAPI_ISteamRemoteStorage_GetFileTimestamp(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
SteamWorks_ERemoteStoragePlatform SteamAPI_ISteamRemoteStorage_GetSyncPlatforms(SteamWorks_ISteamRemoteStorage* self, const char * pchFile);
SteamWorks_int32 SteamAPI_ISteamRemoteStorage_GetFileCount(SteamWorks_ISteamRemoteStorage* self);
const char * SteamAPI_ISteamRemoteStorage_GetFileNameAndSize(SteamWorks_ISteamRemoteStorage* self, int iFile, SteamWorks_int32 * pnFileSizeInBytes);
bool SteamAPI_ISteamRemoteStorage_GetQuota(SteamWorks_ISteamRemoteStorage* self, SteamWorks_uint64 * pnTotalBytes, SteamWorks_uint64 * puAvailableBytes);
bool SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount(SteamWorks_ISteamRemoteStorage* self);
bool SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp(SteamWorks_ISteamRemoteStorage* self);
void SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp(SteamWorks_ISteamRemoteStorage* self, bool bEnabled);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_UGCDownload(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCHandle_t hContent, SteamWorks_uint32 unPriority);
bool SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCHandle_t hContent, SteamWorks_int32 * pnBytesDownloaded, SteamWorks_int32 * pnBytesExpected);
bool SteamAPI_ISteamRemoteStorage_GetUGCDetails(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCHandle_t hContent, SteamWorks_AppId_t * pnAppID, char ** ppchName, SteamWorks_int32 * pnFileSizeInBytes, SteamWorks_CSteamID * pSteamIDOwner);
SteamWorks_int32 SteamAPI_ISteamRemoteStorage_UGCRead(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCHandle_t hContent, void * pvData, SteamWorks_int32 cubDataToRead, SteamWorks_uint32 cOffset, SteamWorks_EUGCReadAction eAction);
SteamWorks_int32 SteamAPI_ISteamRemoteStorage_GetCachedUGCCount(SteamWorks_ISteamRemoteStorage* self);
SteamWorks_UGCHandle_t SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle(SteamWorks_ISteamRemoteStorage* self, SteamWorks_int32 iCachedContent);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_PublishWorkshopFile(SteamWorks_ISteamRemoteStorage* self, const char * pchFile, const char * pchPreviewFile, SteamWorks_AppId_t nConsumerAppId, const char * pchTitle, const char * pchDescription, SteamWorks_ERemoteStoragePublishedFileVisibility eVisibility, SteamWorks_SteamParamStringArray_t * pTags, SteamWorks_EWorkshopFileType eWorkshopFileType);
SteamWorks_PublishedFileUpdateHandle_t SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId);
bool SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle, const char * pchFile);
bool SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle, const char * pchPreviewFile);
bool SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle, const char * pchTitle);
bool SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle, const char * pchDescription);
bool SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle, SteamWorks_ERemoteStoragePublishedFileVisibility eVisibility);
bool SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle, SteamWorks_SteamParamStringArray_t * pTags);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId, SteamWorks_uint32 unMaxSecondsOld);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_DeletePublishedFile(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles(SteamWorks_ISteamRemoteStorage* self, SteamWorks_uint32 unStartIndex);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_SubscribePublishedFile(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles(SteamWorks_ISteamRemoteStorage* self, SteamWorks_uint32 unStartIndex);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId);
bool SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileUpdateHandle_t updateHandle, const char * pchChangeDescription);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId, bool bVoteUp);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles(SteamWorks_ISteamRemoteStorage* self, SteamWorks_CSteamID steamId, SteamWorks_uint32 unStartIndex, SteamWorks_SteamParamStringArray_t * pRequiredTags, SteamWorks_SteamParamStringArray_t * pExcludedTags);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_PublishVideo(SteamWorks_ISteamRemoteStorage* self, SteamWorks_EWorkshopVideoProvider eVideoProvider, const char * pchVideoAccount, const char * pchVideoIdentifier, const char * pchPreviewFile, SteamWorks_AppId_t nConsumerAppId, const char * pchTitle, const char * pchDescription, SteamWorks_ERemoteStoragePublishedFileVisibility eVisibility, SteamWorks_SteamParamStringArray_t * pTags);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction(SteamWorks_ISteamRemoteStorage* self, SteamWorks_PublishedFileId_t unPublishedFileId, SteamWorks_EWorkshopFileAction eAction);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction(SteamWorks_ISteamRemoteStorage* self, SteamWorks_EWorkshopFileAction eAction, SteamWorks_uint32 unStartIndex);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles(SteamWorks_ISteamRemoteStorage* self, SteamWorks_EWorkshopEnumerationType eEnumerationType, SteamWorks_uint32 unStartIndex, SteamWorks_uint32 unCount, SteamWorks_uint32 unDays, SteamWorks_SteamParamStringArray_t * pTags, SteamWorks_SteamParamStringArray_t * pUserTags);
SteamWorks_SteamAPICall_t SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation(SteamWorks_ISteamRemoteStorage* self, SteamWorks_UGCHandle_t hContent, const char * pchLocation, SteamWorks_uint32 unPriority);
bool SteamAPI_ISteamUserStats_RequestCurrentStats(SteamWorks_ISteamUserStats* self);
bool SteamAPI_ISteamUserStats_GetStat(SteamWorks_ISteamUserStats* self, const char * pchName, SteamWorks_int32 * pData);
bool SteamAPI_ISteamUserStats_GetStat(SteamWorks_ISteamUserStats* self, const char * pchName, float * pData);
bool SteamAPI_ISteamUserStats_SetStat(SteamWorks_ISteamUserStats* self, const char * pchName, SteamWorks_int32 nData);
bool SteamAPI_ISteamUserStats_SetStat(SteamWorks_ISteamUserStats* self, const char * pchName, float fData);
bool SteamAPI_ISteamUserStats_UpdateAvgRateStat(SteamWorks_ISteamUserStats* self, const char * pchName, float flCountThisSession, double dSessionLength);
bool SteamAPI_ISteamUserStats_GetAchievement(SteamWorks_ISteamUserStats* self, const char * pchName, bool * pbAchieved);
bool SteamAPI_ISteamUserStats_SetAchievement(SteamWorks_ISteamUserStats* self, const char * pchName);
bool SteamAPI_ISteamUserStats_ClearAchievement(SteamWorks_ISteamUserStats* self, const char * pchName);
bool SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime(SteamWorks_ISteamUserStats* self, const char * pchName, bool * pbAchieved, SteamWorks_uint32 * punUnlockTime);
bool SteamAPI_ISteamUserStats_StoreStats(SteamWorks_ISteamUserStats* self);
int SteamAPI_ISteamUserStats_GetAchievementIcon(SteamWorks_ISteamUserStats* self, const char * pchName);
const char * SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute(SteamWorks_ISteamUserStats* self, const char * pchName, const char * pchKey);
bool SteamAPI_ISteamUserStats_IndicateAchievementProgress(SteamWorks_ISteamUserStats* self, const char * pchName, SteamWorks_uint32 nCurProgress, SteamWorks_uint32 nMaxProgress);
SteamWorks_uint32 SteamAPI_ISteamUserStats_GetNumAchievements(SteamWorks_ISteamUserStats* self);
const char * SteamAPI_ISteamUserStats_GetAchievementName(SteamWorks_ISteamUserStats* self, SteamWorks_uint32 iAchievement);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_RequestUserStats(SteamWorks_ISteamUserStats* self, SteamWorks_CSteamID steamIDUser);
bool SteamAPI_ISteamUserStats_GetUserStat(SteamWorks_ISteamUserStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, SteamWorks_int32 * pData);
bool SteamAPI_ISteamUserStats_GetUserStat(SteamWorks_ISteamUserStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, float * pData);
bool SteamAPI_ISteamUserStats_GetUserAchievement(SteamWorks_ISteamUserStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, bool * pbAchieved);
bool SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime(SteamWorks_ISteamUserStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, bool * pbAchieved, SteamWorks_uint32 * punUnlockTime);
bool SteamAPI_ISteamUserStats_ResetAllStats(SteamWorks_ISteamUserStats* self, bool bAchievementsToo);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_FindOrCreateLeaderboard(SteamWorks_ISteamUserStats* self, const char * pchLeaderboardName, SteamWorks_ELeaderboardSortMethod eLeaderboardSortMethod, SteamWorks_ELeaderboardDisplayType eLeaderboardDisplayType);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_FindLeaderboard(SteamWorks_ISteamUserStats* self, const char * pchLeaderboardName);
const char * SteamAPI_ISteamUserStats_GetLeaderboardName(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard);
int SteamAPI_ISteamUserStats_GetLeaderboardEntryCount(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard);
SteamWorks_ELeaderboardSortMethod SteamAPI_ISteamUserStats_GetLeaderboardSortMethod(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard);
SteamWorks_ELeaderboardDisplayType SteamAPI_ISteamUserStats_GetLeaderboardDisplayType(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_DownloadLeaderboardEntries(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard, SteamWorks_ELeaderboardDataRequest eLeaderboardDataRequest, int nRangeStart, int nRangeEnd);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard, SteamWorks_CSteamID * prgUsers, int cUsers);
bool SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboardEntries_t hSteamLeaderboardEntries, int index, SteamWorks_LeaderboardEntry_t * pLeaderboardEntry, SteamWorks_int32 * pDetails, int cDetailsMax);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_UploadLeaderboardScore(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard, SteamWorks_ELeaderboardUploadScoreMethod eLeaderboardUploadScoreMethod, SteamWorks_int32 nScore, SteamWorks_int32 * pScoreDetails, int cScoreDetailsCount);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_AttachLeaderboardUGC(SteamWorks_ISteamUserStats* self, SteamWorks_SteamLeaderboard_t hSteamLeaderboard, SteamWorks_UGCHandle_t hUGC);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers(SteamWorks_ISteamUserStats* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages(SteamWorks_ISteamUserStats* self);
int SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo(SteamWorks_ISteamUserStats* self, char * pchName, SteamWorks_uint32 unNameBufLen, float * pflPercent, bool * pbAchieved);
int SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo(SteamWorks_ISteamUserStats* self, int iIteratorPrevious, char * pchName, SteamWorks_uint32 unNameBufLen, float * pflPercent, bool * pbAchieved);
bool SteamAPI_ISteamUserStats_GetAchievementAchievedPercent(SteamWorks_ISteamUserStats* self, const char * pchName, float * pflPercent);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUserStats_RequestGlobalStats(SteamWorks_ISteamUserStats* self, int nHistoryDays);
bool SteamAPI_ISteamUserStats_GetGlobalStat(SteamWorks_ISteamUserStats* self, const char * pchStatName, SteamWorks_int64 * pData);
bool SteamAPI_ISteamUserStats_GetGlobalStat(SteamWorks_ISteamUserStats* self, const char * pchStatName, double * pData);
SteamWorks_int32 SteamAPI_ISteamUserStats_GetGlobalStatHistory(SteamWorks_ISteamUserStats* self, const char * pchStatName, SteamWorks_int64 * pData, SteamWorks_uint32 cubData);
SteamWorks_int32 SteamAPI_ISteamUserStats_GetGlobalStatHistory(SteamWorks_ISteamUserStats* self, const char * pchStatName, double * pData, SteamWorks_uint32 cubData);
bool SteamAPI_ISteamApps_BIsSubscribed(SteamWorks_ISteamApps* self);
bool SteamAPI_ISteamApps_BIsLowViolence(SteamWorks_ISteamApps* self);
bool SteamAPI_ISteamApps_BIsCybercafe(SteamWorks_ISteamApps* self);
bool SteamAPI_ISteamApps_BIsVACBanned(SteamWorks_ISteamApps* self);
const char * SteamAPI_ISteamApps_GetCurrentGameLanguage(SteamWorks_ISteamApps* self);
const char * SteamAPI_ISteamApps_GetAvailableGameLanguages(SteamWorks_ISteamApps* self);
bool SteamAPI_ISteamApps_BIsSubscribedApp(SteamWorks_ISteamApps* self, SteamWorks_AppId_t appID);
bool SteamAPI_ISteamApps_BIsDlcInstalled(SteamWorks_ISteamApps* self, SteamWorks_AppId_t appID);
SteamWorks_uint32 SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime(SteamWorks_ISteamApps* self, SteamWorks_AppId_t nAppID);
bool SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend(SteamWorks_ISteamApps* self);
int SteamAPI_ISteamApps_GetDLCCount(SteamWorks_ISteamApps* self);
bool SteamAPI_ISteamApps_BGetDLCDataByIndex(SteamWorks_ISteamApps* self, int iDLC, SteamWorks_AppId_t * pAppID, bool * pbAvailable, char * pchName, int cchNameBufferSize);
void SteamAPI_ISteamApps_InstallDLC(SteamWorks_ISteamApps* self, SteamWorks_AppId_t nAppID);
void SteamAPI_ISteamApps_UninstallDLC(SteamWorks_ISteamApps* self, SteamWorks_AppId_t nAppID);
void SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey(SteamWorks_ISteamApps* self, SteamWorks_AppId_t nAppID);
bool SteamAPI_ISteamApps_GetCurrentBetaName(SteamWorks_ISteamApps* self, char * pchName, int cchNameBufferSize);
bool SteamAPI_ISteamApps_MarkContentCorrupt(SteamWorks_ISteamApps* self, bool bMissingFilesOnly);
SteamWorks_uint32 SteamAPI_ISteamApps_GetInstalledDepots(SteamWorks_ISteamApps* self, SteamWorks_AppId_t appID, SteamWorks_DepotId_t * pvecDepots, SteamWorks_uint32 cMaxDepots);
SteamWorks_uint32 SteamAPI_ISteamApps_GetAppInstallDir(SteamWorks_ISteamApps* self, SteamWorks_AppId_t appID, char * pchFolder, SteamWorks_uint32 cchFolderBufferSize);
bool SteamAPI_ISteamApps_BIsAppInstalled(SteamWorks_ISteamApps* self, SteamWorks_AppId_t appID);
SteamWorks_CSteamID SteamAPI_ISteamApps_GetAppOwner(SteamWorks_ISteamApps* self);
const char * SteamAPI_ISteamApps_GetLaunchQueryParam(SteamWorks_ISteamApps* self, const char * pchKey);
bool SteamAPI_ISteamApps_GetDlcDownloadProgress(SteamWorks_ISteamApps* self, SteamWorks_AppId_t nAppID, SteamWorks_uint64 * punBytesDownloaded, SteamWorks_uint64 * punBytesTotal);
int SteamAPI_ISteamApps_GetAppBuildId(SteamWorks_ISteamApps* self);
void SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys(SteamWorks_ISteamApps* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamApps_GetFileDetails(SteamWorks_ISteamApps* self, const char * pszFileName);
bool SteamAPI_ISteamNetworking_SendP2PPacket(SteamWorks_ISteamNetworking* self, SteamWorks_CSteamID steamIDRemote, void * pubData, SteamWorks_uint32 cubData, SteamWorks_EP2PSend eP2PSendType, int nChannel);
bool SteamAPI_ISteamNetworking_IsP2PPacketAvailable(SteamWorks_ISteamNetworking* self, SteamWorks_uint32 * pcubMsgSize, int nChannel);
bool SteamAPI_ISteamNetworking_ReadP2PPacket(SteamWorks_ISteamNetworking* self, void * pubDest, SteamWorks_uint32 cubDest, SteamWorks_uint32 * pcubMsgSize, SteamWorks_CSteamID * psteamIDRemote, int nChannel);
bool SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser(SteamWorks_ISteamNetworking* self, SteamWorks_CSteamID steamIDRemote);
bool SteamAPI_ISteamNetworking_CloseP2PSessionWithUser(SteamWorks_ISteamNetworking* self, SteamWorks_CSteamID steamIDRemote);
bool SteamAPI_ISteamNetworking_CloseP2PChannelWithUser(SteamWorks_ISteamNetworking* self, SteamWorks_CSteamID steamIDRemote, int nChannel);
bool SteamAPI_ISteamNetworking_GetP2PSessionState(SteamWorks_ISteamNetworking* self, SteamWorks_CSteamID steamIDRemote, SteamWorks_P2PSessionState_t * pConnectionState);
bool SteamAPI_ISteamNetworking_AllowP2PPacketRelay(SteamWorks_ISteamNetworking* self, bool bAllow);
SteamWorks_SNetListenSocket_t SteamAPI_ISteamNetworking_CreateListenSocket(SteamWorks_ISteamNetworking* self, int nVirtualP2PPort, SteamWorks_uint32 nIP, SteamWorks_uint16 nPort, bool bAllowUseOfPacketRelay);
SteamWorks_SNetSocket_t SteamAPI_ISteamNetworking_CreateP2PConnectionSocket(SteamWorks_ISteamNetworking* self, SteamWorks_CSteamID steamIDTarget, int nVirtualPort, int nTimeoutSec, bool bAllowUseOfPacketRelay);
SteamWorks_SNetSocket_t SteamAPI_ISteamNetworking_CreateConnectionSocket(SteamWorks_ISteamNetworking* self, SteamWorks_uint32 nIP, SteamWorks_uint16 nPort, int nTimeoutSec);
bool SteamAPI_ISteamNetworking_DestroySocket(SteamWorks_ISteamNetworking* self, SteamWorks_SNetSocket_t hSocket, bool bNotifyRemoteEnd);
bool SteamAPI_ISteamNetworking_DestroyListenSocket(SteamWorks_ISteamNetworking* self, SteamWorks_SNetListenSocket_t hSocket, bool bNotifyRemoteEnd);
bool SteamAPI_ISteamNetworking_SendDataOnSocket(SteamWorks_ISteamNetworking* self, SteamWorks_SNetSocket_t hSocket, void * pubData, SteamWorks_uint32 cubData, bool bReliable);
bool SteamAPI_ISteamNetworking_IsDataAvailableOnSocket(SteamWorks_ISteamNetworking* self, SteamWorks_SNetSocket_t hSocket, SteamWorks_uint32 * pcubMsgSize);
bool SteamAPI_ISteamNetworking_RetrieveDataFromSocket(SteamWorks_ISteamNetworking* self, SteamWorks_SNetSocket_t hSocket, void * pubDest, SteamWorks_uint32 cubDest, SteamWorks_uint32 * pcubMsgSize);
bool SteamAPI_ISteamNetworking_IsDataAvailable(SteamWorks_ISteamNetworking* self, SteamWorks_SNetListenSocket_t hListenSocket, SteamWorks_uint32 * pcubMsgSize, SteamWorks_SNetSocket_t * phSocket);
bool SteamAPI_ISteamNetworking_RetrieveData(SteamWorks_ISteamNetworking* self, SteamWorks_SNetListenSocket_t hListenSocket, void * pubDest, SteamWorks_uint32 cubDest, SteamWorks_uint32 * pcubMsgSize, SteamWorks_SNetSocket_t * phSocket);
bool SteamAPI_ISteamNetworking_GetSocketInfo(SteamWorks_ISteamNetworking* self, SteamWorks_SNetSocket_t hSocket, SteamWorks_CSteamID * pSteamIDRemote, int * peSocketStatus, SteamWorks_uint32 * punIPRemote, SteamWorks_uint16 * punPortRemote);
bool SteamAPI_ISteamNetworking_GetListenSocketInfo(SteamWorks_ISteamNetworking* self, SteamWorks_SNetListenSocket_t hListenSocket, SteamWorks_uint32 * pnIP, SteamWorks_uint16 * pnPort);
SteamWorks_ESNetSocketConnectionType SteamAPI_ISteamNetworking_GetSocketConnectionType(SteamWorks_ISteamNetworking* self, SteamWorks_SNetSocket_t hSocket);
int SteamAPI_ISteamNetworking_GetMaxPacketSize(SteamWorks_ISteamNetworking* self, SteamWorks_SNetSocket_t hSocket);
SteamWorks_ScreenshotHandle SteamAPI_ISteamScreenshots_WriteScreenshot(SteamWorks_ISteamScreenshots* self, void * pubRGB, SteamWorks_uint32 cubRGB, int nWidth, int nHeight);
SteamWorks_ScreenshotHandle SteamAPI_ISteamScreenshots_AddScreenshotToLibrary(SteamWorks_ISteamScreenshots* self, const char * pchFilename, const char * pchThumbnailFilename, int nWidth, int nHeight);
void SteamAPI_ISteamScreenshots_TriggerScreenshot(SteamWorks_ISteamScreenshots* self);
void SteamAPI_ISteamScreenshots_HookScreenshots(SteamWorks_ISteamScreenshots* self, bool bHook);
bool SteamAPI_ISteamScreenshots_SetLocation(SteamWorks_ISteamScreenshots* self, SteamWorks_ScreenshotHandle hScreenshot, const char * pchLocation);
bool SteamAPI_ISteamScreenshots_TagUser(SteamWorks_ISteamScreenshots* self, SteamWorks_ScreenshotHandle hScreenshot, SteamWorks_CSteamID steamID);
bool SteamAPI_ISteamScreenshots_TagPublishedFile(SteamWorks_ISteamScreenshots* self, SteamWorks_ScreenshotHandle hScreenshot, SteamWorks_PublishedFileId_t unPublishedFileID);
bool SteamAPI_ISteamScreenshots_IsScreenshotsHooked(SteamWorks_ISteamScreenshots* self);
SteamWorks_ScreenshotHandle SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary(SteamWorks_ISteamScreenshots* self, SteamWorks_EVRScreenshotType eType, const char * pchFilename, const char * pchVRFilename);
bool SteamAPI_ISteamMusic_BIsEnabled(SteamWorks_ISteamMusic* self);
bool SteamAPI_ISteamMusic_BIsPlaying(SteamWorks_ISteamMusic* self);
SteamWorks_AudioPlayback_Status SteamAPI_ISteamMusic_GetPlaybackStatus(SteamWorks_ISteamMusic* self);
void SteamAPI_ISteamMusic_Play(SteamWorks_ISteamMusic* self);
void SteamAPI_ISteamMusic_Pause(SteamWorks_ISteamMusic* self);
void SteamAPI_ISteamMusic_PlayPrevious(SteamWorks_ISteamMusic* self);
void SteamAPI_ISteamMusic_PlayNext(SteamWorks_ISteamMusic* self);
void SteamAPI_ISteamMusic_SetVolume(SteamWorks_ISteamMusic* self, float flVolume);
float SteamAPI_ISteamMusic_GetVolume(SteamWorks_ISteamMusic* self);
bool SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote(SteamWorks_ISteamMusicRemote* self, const char * pchName);
bool SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_BActivationSuccess(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_SetDisplayName(SteamWorks_ISteamMusicRemote* self, const char * pchDisplayName);
bool SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64(SteamWorks_ISteamMusicRemote* self, void * pvBuffer, SteamWorks_uint32 cbBufferLength);
bool SteamAPI_ISteamMusicRemote_EnablePlayPrevious(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_EnablePlayNext(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_EnableShuffled(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_EnableLooped(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_EnableQueue(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_EnablePlaylists(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus(SteamWorks_ISteamMusicRemote* self, SteamWorks_AudioPlayback_Status nStatus);
bool SteamAPI_ISteamMusicRemote_UpdateShuffled(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_UpdateLooped(SteamWorks_ISteamMusicRemote* self, bool bValue);
bool SteamAPI_ISteamMusicRemote_UpdateVolume(SteamWorks_ISteamMusicRemote* self, float flValue);
bool SteamAPI_ISteamMusicRemote_CurrentEntryWillChange(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable(SteamWorks_ISteamMusicRemote* self, bool bAvailable);
bool SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText(SteamWorks_ISteamMusicRemote* self, const char * pchText);
bool SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds(SteamWorks_ISteamMusicRemote* self, int nValue);
bool SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt(SteamWorks_ISteamMusicRemote* self, void * pvBuffer, SteamWorks_uint32 cbBufferLength);
bool SteamAPI_ISteamMusicRemote_CurrentEntryDidChange(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_QueueWillChange(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_ResetQueueEntries(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_SetQueueEntry(SteamWorks_ISteamMusicRemote* self, int nID, int nPosition, const char * pchEntryText);
bool SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry(SteamWorks_ISteamMusicRemote* self, int nID);
bool SteamAPI_ISteamMusicRemote_QueueDidChange(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_PlaylistWillChange(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_ResetPlaylistEntries(SteamWorks_ISteamMusicRemote* self);
bool SteamAPI_ISteamMusicRemote_SetPlaylistEntry(SteamWorks_ISteamMusicRemote* self, int nID, int nPosition, const char * pchEntryText);
bool SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry(SteamWorks_ISteamMusicRemote* self, int nID);
bool SteamAPI_ISteamMusicRemote_PlaylistDidChange(SteamWorks_ISteamMusicRemote* self);
SteamWorks_HTTPRequestHandle SteamAPI_ISteamHTTP_CreateHTTPRequest(SteamWorks_ISteamHTTP* self, SteamWorks_EHTTPMethod eHTTPRequestMethod, const char * pchAbsoluteURL);
bool SteamAPI_ISteamHTTP_SetHTTPRequestContextValue(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_uint64 ulContextValue);
bool SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_uint32 unTimeoutSeconds);
bool SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, const char * pchHeaderName, const char * pchHeaderValue);
bool SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, const char * pchParamName, const char * pchParamValue);
bool SteamAPI_ISteamHTTP_SendHTTPRequest(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_SteamAPICall_t * pCallHandle);
bool SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_SteamAPICall_t * pCallHandle);
bool SteamAPI_ISteamHTTP_DeferHTTPRequest(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest);
bool SteamAPI_ISteamHTTP_PrioritizeHTTPRequest(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest);
bool SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, const char * pchHeaderName, SteamWorks_uint32 * unResponseHeaderSize);
bool SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, const char * pchHeaderName, SteamWorks_uint8 * pHeaderValueBuffer, SteamWorks_uint32 unBufferSize);
bool SteamAPI_ISteamHTTP_GetHTTPResponseBodySize(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_uint32 * unBodySize);
bool SteamAPI_ISteamHTTP_GetHTTPResponseBodyData(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_uint8 * pBodyDataBuffer, SteamWorks_uint32 unBufferSize);
bool SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_uint32 cOffset, SteamWorks_uint8 * pBodyDataBuffer, SteamWorks_uint32 unBufferSize);
bool SteamAPI_ISteamHTTP_ReleaseHTTPRequest(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest);
bool SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, float * pflPercentOut);
bool SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, const char * pchContentType, SteamWorks_uint8 * pubBody, SteamWorks_uint32 unBodyLen);
SteamWorks_HTTPCookieContainerHandle SteamAPI_ISteamHTTP_CreateCookieContainer(SteamWorks_ISteamHTTP* self, bool bAllowResponsesToModify);
bool SteamAPI_ISteamHTTP_ReleaseCookieContainer(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPCookieContainerHandle hCookieContainer);
bool SteamAPI_ISteamHTTP_SetCookie(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPCookieContainerHandle hCookieContainer, const char * pchHost, const char * pchUrl, const char * pchCookie);
bool SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_HTTPCookieContainerHandle hCookieContainer);
bool SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, const char * pchUserAgentInfo);
bool SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, bool bRequireVerifiedCertificate);
bool SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, SteamWorks_uint32 unMilliseconds);
bool SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut(SteamWorks_ISteamHTTP* self, SteamWorks_HTTPRequestHandle hRequest, bool * pbWasTimedOut);
SteamWorks_ClientUnifiedMessageHandle SteamAPI_ISteamUnifiedMessages_SendMethod(SteamWorks_ISteamUnifiedMessages* self, const char * pchServiceMethod, void * pRequestBuffer, SteamWorks_uint32 unRequestBufferSize, SteamWorks_uint64 unContext);
bool SteamAPI_ISteamUnifiedMessages_GetMethodResponseInfo(SteamWorks_ISteamUnifiedMessages* self, SteamWorks_ClientUnifiedMessageHandle hHandle, SteamWorks_uint32 * punResponseSize, SteamWorks_EResult * peResult);
bool SteamAPI_ISteamUnifiedMessages_GetMethodResponseData(SteamWorks_ISteamUnifiedMessages* self, SteamWorks_ClientUnifiedMessageHandle hHandle, void * pResponseBuffer, SteamWorks_uint32 unResponseBufferSize, bool bAutoRelease);
bool SteamAPI_ISteamUnifiedMessages_ReleaseMethod(SteamWorks_ISteamUnifiedMessages* self, SteamWorks_ClientUnifiedMessageHandle hHandle);
bool SteamAPI_ISteamUnifiedMessages_SendNotification(SteamWorks_ISteamUnifiedMessages* self, const char * pchServiceNotification, void * pNotificationBuffer, SteamWorks_uint32 unNotificationBufferSize);
bool SteamAPI_ISteamController_Init(SteamWorks_ISteamController* self);
bool SteamAPI_ISteamController_Shutdown(SteamWorks_ISteamController* self);
void SteamAPI_ISteamController_RunFrame(SteamWorks_ISteamController* self);
int SteamAPI_ISteamController_GetConnectedControllers(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t * handlesOut);
bool SteamAPI_ISteamController_ShowBindingPanel(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle);
SteamWorks_ControllerActionSetHandle_t SteamAPI_ISteamController_GetActionSetHandle(SteamWorks_ISteamController* self, const char * pszActionSetName);
void SteamAPI_ISteamController_ActivateActionSet(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerActionSetHandle_t actionSetHandle);
SteamWorks_ControllerActionSetHandle_t SteamAPI_ISteamController_GetCurrentActionSet(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle);
SteamWorks_ControllerDigitalActionHandle_t SteamAPI_ISteamController_GetDigitalActionHandle(SteamWorks_ISteamController* self, const char * pszActionName);
struct SteamWorks_ControllerDigitalActionData_t SteamAPI_ISteamController_GetDigitalActionData(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerDigitalActionHandle_t digitalActionHandle);
int SteamAPI_ISteamController_GetDigitalActionOrigins(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerActionSetHandle_t actionSetHandle, SteamWorks_ControllerDigitalActionHandle_t digitalActionHandle, SteamWorks_EControllerActionOrigin * originsOut);
SteamWorks_ControllerAnalogActionHandle_t SteamAPI_ISteamController_GetAnalogActionHandle(SteamWorks_ISteamController* self, const char * pszActionName);
struct SteamWorks_ControllerAnalogActionData_t SteamAPI_ISteamController_GetAnalogActionData(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerAnalogActionHandle_t analogActionHandle);
int SteamAPI_ISteamController_GetAnalogActionOrigins(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerActionSetHandle_t actionSetHandle, SteamWorks_ControllerAnalogActionHandle_t analogActionHandle, SteamWorks_EControllerActionOrigin * originsOut);
void SteamAPI_ISteamController_StopAnalogActionMomentum(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerAnalogActionHandle_t eAction);
void SteamAPI_ISteamController_TriggerHapticPulse(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ESteamControllerPad eTargetPad, unsigned short usDurationMicroSec);
void SteamAPI_ISteamController_TriggerRepeatedHapticPulse(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ESteamControllerPad eTargetPad, unsigned short usDurationMicroSec, unsigned short usOffMicroSec, unsigned short unRepeat, unsigned int nFlags);
void SteamAPI_ISteamController_TriggerVibration(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, unsigned short usLeftSpeed, unsigned short usRightSpeed);
void SteamAPI_ISteamController_SetLEDColor(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_uint8 nColorR, SteamWorks_uint8 nColorG, SteamWorks_uint8 nColorB, unsigned int nFlags);
int SteamAPI_ISteamController_GetGamepadIndexForController(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t ulControllerHandle);
SteamWorks_ControllerHandle_t SteamAPI_ISteamController_GetControllerForGamepadIndex(SteamWorks_ISteamController* self, int nIndex);
struct SteamWorks_ControllerMotionData_t SteamAPI_ISteamController_GetMotionData(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle);
bool SteamAPI_ISteamController_ShowDigitalActionOrigins(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerDigitalActionHandle_t digitalActionHandle, float flScale, float flXPosition, float flYPosition);
bool SteamAPI_ISteamController_ShowAnalogActionOrigins(SteamWorks_ISteamController* self, SteamWorks_ControllerHandle_t controllerHandle, SteamWorks_ControllerAnalogActionHandle_t analogActionHandle, float flScale, float flXPosition, float flYPosition);
const char * SteamAPI_ISteamController_GetStringForActionOrigin(SteamWorks_ISteamController* self, SteamWorks_EControllerActionOrigin eOrigin);
const char * SteamAPI_ISteamController_GetGlyphForActionOrigin(SteamWorks_ISteamController* self, SteamWorks_EControllerActionOrigin eOrigin);
SteamWorks_UGCQueryHandle_t SteamAPI_ISteamUGC_CreateQueryUserUGCRequest(SteamWorks_ISteamUGC* self, SteamWorks_AccountID_t unAccountID, SteamWorks_EUserUGCList eListType, SteamWorks_EUGCMatchingUGCType eMatchingUGCType, SteamWorks_EUserUGCListSortOrder eSortOrder, SteamWorks_AppId_t nCreatorAppID, SteamWorks_AppId_t nConsumerAppID, SteamWorks_uint32 unPage);
SteamWorks_UGCQueryHandle_t SteamAPI_ISteamUGC_CreateQueryAllUGCRequest(SteamWorks_ISteamUGC* self, SteamWorks_EUGCQuery eQueryType, SteamWorks_EUGCMatchingUGCType eMatchingeMatchingUGCTypeFileType, SteamWorks_AppId_t nCreatorAppID, SteamWorks_AppId_t nConsumerAppID, SteamWorks_uint32 unPage);
SteamWorks_UGCQueryHandle_t SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t * pvecPublishedFileID, SteamWorks_uint32 unNumPublishedFileIDs);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_SendQueryUGCRequest(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle);
bool SteamAPI_ISteamUGC_GetQueryUGCResult(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index, SteamWorks_SteamUGCDetails_t * pDetails);
bool SteamAPI_ISteamUGC_GetQueryUGCPreviewURL(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index, char * pchURL, SteamWorks_uint32 cchURLSize);
bool SteamAPI_ISteamUGC_GetQueryUGCMetadata(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index, char * pchMetadata, SteamWorks_uint32 cchMetadatasize);
bool SteamAPI_ISteamUGC_GetQueryUGCChildren(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index, SteamWorks_PublishedFileId_t * pvecPublishedFileID, SteamWorks_uint32 cMaxEntries);
bool SteamAPI_ISteamUGC_GetQueryUGCStatistic(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index, SteamWorks_EItemStatistic eStatType, SteamWorks_uint64 * pStatValue);
SteamWorks_uint32 SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index);
bool SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index, SteamWorks_uint32 previewIndex, char * pchURLOrVideoID, SteamWorks_uint32 cchURLSize, char * pchOriginalFileName, SteamWorks_uint32 cchOriginalFileNameSize, SteamWorks_EItemPreviewType * pPreviewType);
SteamWorks_uint32 SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index);
bool SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 index, SteamWorks_uint32 keyValueTagIndex, char * pchKey, SteamWorks_uint32 cchKeySize, char * pchValue, SteamWorks_uint32 cchValueSize);
bool SteamAPI_ISteamUGC_ReleaseQueryUGCRequest(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle);
bool SteamAPI_ISteamUGC_AddRequiredTag(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, const char * pTagName);
bool SteamAPI_ISteamUGC_AddExcludedTag(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, const char * pTagName);
bool SteamAPI_ISteamUGC_SetReturnOnlyIDs(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bReturnOnlyIDs);
bool SteamAPI_ISteamUGC_SetReturnKeyValueTags(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bReturnKeyValueTags);
bool SteamAPI_ISteamUGC_SetReturnLongDescription(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bReturnLongDescription);
bool SteamAPI_ISteamUGC_SetReturnMetadata(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bReturnMetadata);
bool SteamAPI_ISteamUGC_SetReturnChildren(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bReturnChildren);
bool SteamAPI_ISteamUGC_SetReturnAdditionalPreviews(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bReturnAdditionalPreviews);
bool SteamAPI_ISteamUGC_SetReturnTotalOnly(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bReturnTotalOnly);
bool SteamAPI_ISteamUGC_SetReturnPlaytimeStats(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 unDays);
bool SteamAPI_ISteamUGC_SetLanguage(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, const char * pchLanguage);
bool SteamAPI_ISteamUGC_SetAllowCachedResponse(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 unMaxAgeSeconds);
bool SteamAPI_ISteamUGC_SetCloudFileNameFilter(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, const char * pMatchCloudFileName);
bool SteamAPI_ISteamUGC_SetMatchAnyTag(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, bool bMatchAnyTag);
bool SteamAPI_ISteamUGC_SetSearchText(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, const char * pSearchText);
bool SteamAPI_ISteamUGC_SetRankedByTrendDays(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, SteamWorks_uint32 unDays);
bool SteamAPI_ISteamUGC_AddRequiredKeyValueTag(SteamWorks_ISteamUGC* self, SteamWorks_UGCQueryHandle_t handle, const char * pKey, const char * pValue);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_RequestUGCDetails(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID, SteamWorks_uint32 unMaxAgeSeconds);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_CreateItem(SteamWorks_ISteamUGC* self, SteamWorks_AppId_t nConsumerAppId, SteamWorks_EWorkshopFileType eFileType);
SteamWorks_UGCUpdateHandle_t SteamAPI_ISteamUGC_StartItemUpdate(SteamWorks_ISteamUGC* self, SteamWorks_AppId_t nConsumerAppId, SteamWorks_PublishedFileId_t nPublishedFileID);
bool SteamAPI_ISteamUGC_SetItemTitle(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pchTitle);
bool SteamAPI_ISteamUGC_SetItemDescription(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pchDescription);
bool SteamAPI_ISteamUGC_SetItemUpdateLanguage(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pchLanguage);
bool SteamAPI_ISteamUGC_SetItemMetadata(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pchMetaData);
bool SteamAPI_ISteamUGC_SetItemVisibility(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, SteamWorks_ERemoteStoragePublishedFileVisibility eVisibility);
bool SteamAPI_ISteamUGC_SetItemTags(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t updateHandle, SteamWorks_SteamParamStringArray_t * pTags);
bool SteamAPI_ISteamUGC_SetItemContent(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pszContentFolder);
bool SteamAPI_ISteamUGC_SetItemPreview(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pszPreviewFile);
bool SteamAPI_ISteamUGC_RemoveItemKeyValueTags(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pchKey);
bool SteamAPI_ISteamUGC_AddItemKeyValueTag(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pchKey, const char * pchValue);
bool SteamAPI_ISteamUGC_AddItemPreviewFile(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pszPreviewFile, SteamWorks_EItemPreviewType type);
bool SteamAPI_ISteamUGC_AddItemPreviewVideo(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pszVideoID);
bool SteamAPI_ISteamUGC_UpdateItemPreviewFile(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, SteamWorks_uint32 index, const char * pszPreviewFile);
bool SteamAPI_ISteamUGC_UpdateItemPreviewVideo(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, SteamWorks_uint32 index, const char * pszVideoID);
bool SteamAPI_ISteamUGC_RemoveItemPreview(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, SteamWorks_uint32 index);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_SubmitItemUpdate(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, const char * pchChangeNote);
SteamWorks_EItemUpdateStatus SteamAPI_ISteamUGC_GetItemUpdateProgress(SteamWorks_ISteamUGC* self, SteamWorks_UGCUpdateHandle_t handle, SteamWorks_uint64 * punBytesProcessed, SteamWorks_uint64 * punBytesTotal);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_SetUserItemVote(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID, bool bVoteUp);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_GetUserItemVote(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_AddItemToFavorites(SteamWorks_ISteamUGC* self, SteamWorks_AppId_t nAppId, SteamWorks_PublishedFileId_t nPublishedFileID);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_RemoveItemFromFavorites(SteamWorks_ISteamUGC* self, SteamWorks_AppId_t nAppId, SteamWorks_PublishedFileId_t nPublishedFileID);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_SubscribeItem(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_UnsubscribeItem(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID);
SteamWorks_uint32 SteamAPI_ISteamUGC_GetNumSubscribedItems(SteamWorks_ISteamUGC* self);
SteamWorks_uint32 SteamAPI_ISteamUGC_GetSubscribedItems(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t * pvecPublishedFileID, SteamWorks_uint32 cMaxEntries);
SteamWorks_uint32 SteamAPI_ISteamUGC_GetItemState(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID);
bool SteamAPI_ISteamUGC_GetItemInstallInfo(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID, SteamWorks_uint64 * punSizeOnDisk, char * pchFolder, SteamWorks_uint32 cchFolderSize, SteamWorks_uint32 * punTimeStamp);
bool SteamAPI_ISteamUGC_GetItemDownloadInfo(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID, SteamWorks_uint64 * punBytesDownloaded, SteamWorks_uint64 * punBytesTotal);
bool SteamAPI_ISteamUGC_DownloadItem(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nPublishedFileID, bool bHighPriority);
bool SteamAPI_ISteamUGC_BInitWorkshopForGameServer(SteamWorks_ISteamUGC* self, SteamWorks_DepotId_t unWorkshopDepotID, const char * pszFolder);
void SteamAPI_ISteamUGC_SuspendDownloads(SteamWorks_ISteamUGC* self, bool bSuspend);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_StartPlaytimeTracking(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t * pvecPublishedFileID, SteamWorks_uint32 unNumPublishedFileIDs);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_StopPlaytimeTracking(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t * pvecPublishedFileID, SteamWorks_uint32 unNumPublishedFileIDs);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems(SteamWorks_ISteamUGC* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_AddDependency(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nParentPublishedFileID, SteamWorks_PublishedFileId_t nChildPublishedFileID);
SteamWorks_SteamAPICall_t SteamAPI_ISteamUGC_RemoveDependency(SteamWorks_ISteamUGC* self, SteamWorks_PublishedFileId_t nParentPublishedFileID, SteamWorks_PublishedFileId_t nChildPublishedFileID);
SteamWorks_uint32 SteamAPI_ISteamAppList_GetNumInstalledApps(SteamWorks_ISteamAppList* self);
SteamWorks_uint32 SteamAPI_ISteamAppList_GetInstalledApps(SteamWorks_ISteamAppList* self, SteamWorks_AppId_t * pvecAppID, SteamWorks_uint32 unMaxAppIDs);
int SteamAPI_ISteamAppList_GetAppName(SteamWorks_ISteamAppList* self, SteamWorks_AppId_t nAppID, char * pchName, int cchNameMax);
int SteamAPI_ISteamAppList_GetAppInstallDir(SteamWorks_ISteamAppList* self, SteamWorks_AppId_t nAppID, char * pchDirectory, int cchNameMax);
int SteamAPI_ISteamAppList_GetAppBuildId(SteamWorks_ISteamAppList* self, SteamWorks_AppId_t nAppID);
void SteamAPI_ISteamHTMLSurface_DestructISteamHTMLSurface(SteamWorks_ISteamHTMLSurface* self);
bool SteamAPI_ISteamHTMLSurface_Init(SteamWorks_ISteamHTMLSurface* self);
bool SteamAPI_ISteamHTMLSurface_Shutdown(SteamWorks_ISteamHTMLSurface* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamHTMLSurface_CreateBrowser(SteamWorks_ISteamHTMLSurface* self, const char * pchUserAgent, const char * pchUserCSS);
void SteamAPI_ISteamHTMLSurface_RemoveBrowser(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_LoadURL(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, const char * pchURL, const char * pchPostData);
void SteamAPI_ISteamHTMLSurface_SetSize(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_uint32 unWidth, SteamWorks_uint32 unHeight);
void SteamAPI_ISteamHTMLSurface_StopLoad(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_Reload(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_GoBack(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_GoForward(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_AddHeader(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, const char * pchKey, const char * pchValue);
void SteamAPI_ISteamHTMLSurface_ExecuteJavascript(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, const char * pchScript);
void SteamAPI_ISteamHTMLSurface_MouseUp(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_ISteamHTMLSurface_EHTMLMouseButton eMouseButton);
void SteamAPI_ISteamHTMLSurface_MouseDown(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_ISteamHTMLSurface_EHTMLMouseButton eMouseButton);
void SteamAPI_ISteamHTMLSurface_MouseDoubleClick(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_ISteamHTMLSurface_EHTMLMouseButton eMouseButton);
void SteamAPI_ISteamHTMLSurface_MouseMove(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, int x, int y);
void SteamAPI_ISteamHTMLSurface_MouseWheel(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_int32 nDelta);
void SteamAPI_ISteamHTMLSurface_KeyDown(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_uint32 nNativeKeyCode, SteamWorks_ISteamHTMLSurface_EHTMLKeyModifiers eHTMLKeyModifiers);
void SteamAPI_ISteamHTMLSurface_KeyUp(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_uint32 nNativeKeyCode, SteamWorks_ISteamHTMLSurface_EHTMLKeyModifiers eHTMLKeyModifiers);
void SteamAPI_ISteamHTMLSurface_KeyChar(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_uint32 cUnicodeChar, SteamWorks_ISteamHTMLSurface_EHTMLKeyModifiers eHTMLKeyModifiers);
void SteamAPI_ISteamHTMLSurface_SetHorizontalScroll(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_uint32 nAbsolutePixelScroll);
void SteamAPI_ISteamHTMLSurface_SetVerticalScroll(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, SteamWorks_uint32 nAbsolutePixelScroll);
void SteamAPI_ISteamHTMLSurface_SetKeyFocus(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, bool bHasKeyFocus);
void SteamAPI_ISteamHTMLSurface_ViewSource(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_CopyToClipboard(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_PasteFromClipboard(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_Find(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, const char * pchSearchStr, bool bCurrentlyInFind, bool bReverse);
void SteamAPI_ISteamHTMLSurface_StopFind(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle);
void SteamAPI_ISteamHTMLSurface_GetLinkAtPosition(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, int x, int y);
void SteamAPI_ISteamHTMLSurface_SetCookie(SteamWorks_ISteamHTMLSurface* self, const char * pchHostname, const char * pchKey, const char * pchValue, const char * pchPath, SteamWorks_RTime32 nExpires, bool bSecure, bool bHTTPOnly);
void SteamAPI_ISteamHTMLSurface_SetPageScaleFactor(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, float flZoom, int nPointX, int nPointY);
void SteamAPI_ISteamHTMLSurface_SetBackgroundMode(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, bool bBackgroundMode);
void SteamAPI_ISteamHTMLSurface_AllowStartRequest(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, bool bAllowed);
void SteamAPI_ISteamHTMLSurface_JSDialogResponse(SteamWorks_ISteamHTMLSurface* self, SteamWorks_HHTMLBrowser unBrowserHandle, bool bResult);
SteamWorks_EResult SteamAPI_ISteamInventory_GetResultStatus(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t resultHandle);
bool SteamAPI_ISteamInventory_GetResultItems(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t resultHandle, SteamWorks_SteamItemDetails_t * pOutItemsArray, SteamWorks_uint32 * punOutItemsArraySize);
bool SteamAPI_ISteamInventory_GetResultItemProperty(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t resultHandle, SteamWorks_uint32 unItemIndex, const char * pchPropertyName, char * pchValueBuffer, SteamWorks_uint32 * punValueBufferSizeOut);
SteamWorks_uint32 SteamAPI_ISteamInventory_GetResultTimestamp(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t resultHandle);
bool SteamAPI_ISteamInventory_CheckResultSteamID(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t resultHandle, SteamWorks_CSteamID steamIDExpected);
void SteamAPI_ISteamInventory_DestroyResult(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t resultHandle);
bool SteamAPI_ISteamInventory_GetAllItems(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle);
bool SteamAPI_ISteamInventory_GetItemsByID(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemInstanceID_t * pInstanceIDs, SteamWorks_uint32 unCountInstanceIDs);
bool SteamAPI_ISteamInventory_SerializeResult(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t resultHandle, void * pOutBuffer, SteamWorks_uint32 * punOutBufferSize);
bool SteamAPI_ISteamInventory_DeserializeResult(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pOutResultHandle, void * pBuffer, SteamWorks_uint32 unBufferSize, bool bRESERVED_MUST_BE_FALSE);
bool SteamAPI_ISteamInventory_GenerateItems(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemDef_t * pArrayItemDefs, SteamWorks_uint32 * punArrayQuantity, SteamWorks_uint32 unArrayLength);
bool SteamAPI_ISteamInventory_GrantPromoItems(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle);
bool SteamAPI_ISteamInventory_AddPromoItem(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemDef_t itemDef);
bool SteamAPI_ISteamInventory_AddPromoItems(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemDef_t * pArrayItemDefs, SteamWorks_uint32 unArrayLength);
bool SteamAPI_ISteamInventory_ConsumeItem(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemInstanceID_t itemConsume, SteamWorks_uint32 unQuantity);
bool SteamAPI_ISteamInventory_ExchangeItems(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemDef_t * pArrayGenerate, SteamWorks_uint32 * punArrayGenerateQuantity, SteamWorks_uint32 unArrayGenerateLength, SteamWorks_SteamItemInstanceID_t * pArrayDestroy, SteamWorks_uint32 * punArrayDestroyQuantity, SteamWorks_uint32 unArrayDestroyLength);
bool SteamAPI_ISteamInventory_TransferItemQuantity(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemInstanceID_t itemIdSource, SteamWorks_uint32 unQuantity, SteamWorks_SteamItemInstanceID_t itemIdDest);
void SteamAPI_ISteamInventory_SendItemDropHeartbeat(SteamWorks_ISteamInventory* self);
bool SteamAPI_ISteamInventory_TriggerItemDrop(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_SteamItemDef_t dropListDefinition);
bool SteamAPI_ISteamInventory_TradeItems(SteamWorks_ISteamInventory* self, SteamWorks_SteamInventoryResult_t * pResultHandle, SteamWorks_CSteamID steamIDTradePartner, SteamWorks_SteamItemInstanceID_t * pArrayGive, SteamWorks_uint32 * pArrayGiveQuantity, SteamWorks_uint32 nArrayGiveLength, SteamWorks_SteamItemInstanceID_t * pArrayGet, SteamWorks_uint32 * pArrayGetQuantity, SteamWorks_uint32 nArrayGetLength);
bool SteamAPI_ISteamInventory_LoadItemDefinitions(SteamWorks_ISteamInventory* self);
bool SteamAPI_ISteamInventory_GetItemDefinitionIDs(SteamWorks_ISteamInventory* self, SteamWorks_SteamItemDef_t * pItemDefIDs, SteamWorks_uint32 * punItemDefIDsArraySize);
bool SteamAPI_ISteamInventory_GetItemDefinitionProperty(SteamWorks_ISteamInventory* self, SteamWorks_SteamItemDef_t iDefinition, const char * pchPropertyName, char * pchValueBuffer, SteamWorks_uint32 * punValueBufferSizeOut);
SteamWorks_SteamAPICall_t SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs(SteamWorks_ISteamInventory* self, SteamWorks_CSteamID steamID);
bool SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs(SteamWorks_ISteamInventory* self, SteamWorks_CSteamID steamID, SteamWorks_SteamItemDef_t * pItemDefIDs, SteamWorks_uint32 * punItemDefIDsArraySize);
void SteamAPI_ISteamVideo_GetVideoURL(SteamWorks_ISteamVideo* self, SteamWorks_AppId_t unVideoAppID);
bool SteamAPI_ISteamVideo_IsBroadcasting(SteamWorks_ISteamVideo* self, int * pnNumViewers);
void SteamAPI_ISteamVideo_GetOPFSettings(SteamWorks_ISteamVideo* self, SteamWorks_AppId_t unVideoAppID);
bool SteamAPI_ISteamVideo_GetOPFStringForApp(SteamWorks_ISteamVideo* self, SteamWorks_AppId_t unVideoAppID, char * pchBuffer, SteamWorks_int32 * pnBufferSize);
bool SteamAPI_ISteamGameServer_InitGameServer(SteamWorks_ISteamGameServer* self, SteamWorks_uint32 unIP, SteamWorks_uint16 usGamePort, SteamWorks_uint16 usQueryPort, SteamWorks_uint32 unFlags, SteamWorks_AppId_t nGameAppId, const char * pchVersionString);
void SteamAPI_ISteamGameServer_SetProduct(SteamWorks_ISteamGameServer* self, const char * pszProduct);
void SteamAPI_ISteamGameServer_SetGameDescription(SteamWorks_ISteamGameServer* self, const char * pszGameDescription);
void SteamAPI_ISteamGameServer_SetModDir(SteamWorks_ISteamGameServer* self, const char * pszModDir);
void SteamAPI_ISteamGameServer_SetDedicatedServer(SteamWorks_ISteamGameServer* self, bool bDedicated);
void SteamAPI_ISteamGameServer_LogOn(SteamWorks_ISteamGameServer* self, const char * pszToken);
void SteamAPI_ISteamGameServer_LogOnAnonymous(SteamWorks_ISteamGameServer* self);
void SteamAPI_ISteamGameServer_LogOff(SteamWorks_ISteamGameServer* self);
bool SteamAPI_ISteamGameServer_BLoggedOn(SteamWorks_ISteamGameServer* self);
bool SteamAPI_ISteamGameServer_BSecure(SteamWorks_ISteamGameServer* self);
SteamWorks_CSteamID SteamAPI_ISteamGameServer_GetSteamID(SteamWorks_ISteamGameServer* self);
bool SteamAPI_ISteamGameServer_WasRestartRequested(SteamWorks_ISteamGameServer* self);
void SteamAPI_ISteamGameServer_SetMaxPlayerCount(SteamWorks_ISteamGameServer* self, int cPlayersMax);
void SteamAPI_ISteamGameServer_SetBotPlayerCount(SteamWorks_ISteamGameServer* self, int cBotplayers);
void SteamAPI_ISteamGameServer_SetServerName(SteamWorks_ISteamGameServer* self, const char * pszServerName);
void SteamAPI_ISteamGameServer_SetMapName(SteamWorks_ISteamGameServer* self, const char * pszMapName);
void SteamAPI_ISteamGameServer_SetPasswordProtected(SteamWorks_ISteamGameServer* self, bool bPasswordProtected);
void SteamAPI_ISteamGameServer_SetSpectatorPort(SteamWorks_ISteamGameServer* self, SteamWorks_uint16 unSpectatorPort);
void SteamAPI_ISteamGameServer_SetSpectatorServerName(SteamWorks_ISteamGameServer* self, const char * pszSpectatorServerName);
void SteamAPI_ISteamGameServer_ClearAllKeyValues(SteamWorks_ISteamGameServer* self);
void SteamAPI_ISteamGameServer_SetKeyValue(SteamWorks_ISteamGameServer* self, const char * pKey, const char * pValue);
void SteamAPI_ISteamGameServer_SetGameTags(SteamWorks_ISteamGameServer* self, const char * pchGameTags);
void SteamAPI_ISteamGameServer_SetGameData(SteamWorks_ISteamGameServer* self, const char * pchGameData);
void SteamAPI_ISteamGameServer_SetRegion(SteamWorks_ISteamGameServer* self, const char * pszRegion);
bool SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate(SteamWorks_ISteamGameServer* self, SteamWorks_uint32 unIPClient, void * pvAuthBlob, SteamWorks_uint32 cubAuthBlobSize, SteamWorks_CSteamID * pSteamIDUser);
SteamWorks_CSteamID SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection(SteamWorks_ISteamGameServer* self);
void SteamAPI_ISteamGameServer_SendUserDisconnect(SteamWorks_ISteamGameServer* self, SteamWorks_CSteamID steamIDUser);
bool SteamAPI_ISteamGameServer_BUpdateUserData(SteamWorks_ISteamGameServer* self, SteamWorks_CSteamID steamIDUser, const char * pchPlayerName, SteamWorks_uint32 uScore);
SteamWorks_HAuthTicket SteamAPI_ISteamGameServer_GetAuthSessionTicket(SteamWorks_ISteamGameServer* self, void * pTicket, int cbMaxTicket, SteamWorks_uint32 * pcbTicket);
SteamWorks_EBeginAuthSessionResult SteamAPI_ISteamGameServer_BeginAuthSession(SteamWorks_ISteamGameServer* self, void * pAuthTicket, int cbAuthTicket, SteamWorks_CSteamID steamID);
void SteamAPI_ISteamGameServer_EndAuthSession(SteamWorks_ISteamGameServer* self, SteamWorks_CSteamID steamID);
void SteamAPI_ISteamGameServer_CancelAuthTicket(SteamWorks_ISteamGameServer* self, SteamWorks_HAuthTicket hAuthTicket);
SteamWorks_EUserHasLicenseForAppResult SteamAPI_ISteamGameServer_UserHasLicenseForApp(SteamWorks_ISteamGameServer* self, SteamWorks_CSteamID steamID, SteamWorks_AppId_t appID);
bool SteamAPI_ISteamGameServer_RequestUserGroupStatus(SteamWorks_ISteamGameServer* self, SteamWorks_CSteamID steamIDUser, SteamWorks_CSteamID steamIDGroup);
void SteamAPI_ISteamGameServer_GetGameplayStats(SteamWorks_ISteamGameServer* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamGameServer_GetServerReputation(SteamWorks_ISteamGameServer* self);
SteamWorks_uint32 SteamAPI_ISteamGameServer_GetPublicIP(SteamWorks_ISteamGameServer* self);
bool SteamAPI_ISteamGameServer_HandleIncomingPacket(SteamWorks_ISteamGameServer* self, void * pData, int cbData, SteamWorks_uint32 srcIP, SteamWorks_uint16 srcPort);
int SteamAPI_ISteamGameServer_GetNextOutgoingPacket(SteamWorks_ISteamGameServer* self, void * pOut, int cbMaxOut, SteamWorks_uint32 * pNetAdr, SteamWorks_uint16 * pPort);
void SteamAPI_ISteamGameServer_EnableHeartbeats(SteamWorks_ISteamGameServer* self, bool bActive);
void SteamAPI_ISteamGameServer_SetHeartbeatInterval(SteamWorks_ISteamGameServer* self, int iHeartbeatInterval);
void SteamAPI_ISteamGameServer_ForceHeartbeat(SteamWorks_ISteamGameServer* self);
SteamWorks_SteamAPICall_t SteamAPI_ISteamGameServer_AssociateWithClan(SteamWorks_ISteamGameServer* self, SteamWorks_CSteamID steamIDClan);
SteamWorks_SteamAPICall_t SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility(SteamWorks_ISteamGameServer* self, SteamWorks_CSteamID steamIDNewPlayer);
SteamWorks_SteamAPICall_t SteamAPI_ISteamGameServerStats_RequestUserStats(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser);
bool SteamAPI_ISteamGameServerStats_GetUserStat(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, SteamWorks_int32 * pData);
bool SteamAPI_ISteamGameServerStats_GetUserStat(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, float * pData);
bool SteamAPI_ISteamGameServerStats_GetUserAchievement(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, bool * pbAchieved);
bool SteamAPI_ISteamGameServerStats_SetUserStat(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, SteamWorks_int32 nData);
bool SteamAPI_ISteamGameServerStats_SetUserStat(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, float fData);
bool SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName, float flCountThisSession, double dSessionLength);
bool SteamAPI_ISteamGameServerStats_SetUserAchievement(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName);
bool SteamAPI_ISteamGameServerStats_ClearUserAchievement(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser, const char * pchName);
SteamWorks_SteamAPICall_t SteamAPI_ISteamGameServerStats_StoreUserStats(SteamWorks_ISteamGameServerStats* self, SteamWorks_CSteamID steamIDUser);
SteamWorks_ISteamUnifiedMessages *SteamUnifiedMessages();
SteamWorks_ISteamFriends *SteamFriends();
SteamWorks_ISteamNetworking *SteamNetworking();
SteamWorks_ISteamController *SteamController();
SteamWorks_ISteamMatchmakingServers *SteamMatchmakingServers();
SteamWorks_ISteamUserStats *SteamUserStats();
SteamWorks_ISteamHTMLSurface *SteamHTMLSurface();
SteamWorks_ISteamScreenshots *SteamScreenshots();
SteamWorks_ISteamUGC *SteamUGC();
SteamWorks_ISteamApps *SteamApps();
SteamWorks_ISteamInventory *SteamInventory();
SteamWorks_ISteamVideo *SteamVideo();
SteamWorks_ISteamMusicRemote *SteamMusicRemote();
SteamWorks_ISteamMusic *SteamMusic();
SteamWorks_ISteamHTTP *SteamHTTP();
SteamWorks_ISteamUtils *SteamUtils();
SteamWorks_ISteamRemoteStorage *SteamRemoteStorage();
SteamWorks_ISteamAppList *SteamAppList();
SteamWorks_ISteamMatchmaking *SteamMatchmaking();
SteamWorks_ISteamClient *SteamClient();
SteamWorks_ISteamUser *SteamUser();
bool SteamAPI_RestartAppIfNecessary(uint32_t);
bool SteamAPI_Init();
]])

return ffi.load((ffi.os == "Windows" and ffi.arch == "x86" and "steam_api") or (ffi.os == "Windows" and ffi.arch == "x64" and "steam_api64") or "steam_api")