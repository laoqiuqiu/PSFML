{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
           ___  ___  ___  __  __  _
          | _ \/ __|| __||  \/  || |
          |  _/\__ \| _| | |\/| || |__
          |_|  |___/|_|  |_|  |_||____|
PSFML - Simple and Fast Multimedia Library for Pascal

Includes the following open-sources libraries:
* CSFML - https://github.com/SFML/CSFML

Copyright © 2023-present tinyBigGAMES™ LLC
All Rights Reserved.

Website: https://tinybiggames.com
Email  : support@tinybiggames.com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

unit PSFML;

{$IFDEF FPC}
  {$MODE DELPHIUNICODE}
{$ENDIF}

{$Z4}
{$A8}

{$IFNDEF WIN64}
  {$MESSAGE Error 'Unsupported platform'}
{$ENDIF}

interface

uses
  Classes,
  Windows,
  Messages,
  SysUtils,
  StrUtils;

{$REGION ' Constants ' }
const
  PSFML_VERSION_MAJOR = 2;
  PSFML_VERSION_MINOR = 6;
  PSFML_VERSION_PATCH = 0;

  sfFalse = 0;
  sfTrue  = 1;

  sfStopped = 0;
  sfPaused = 1;
  sfPlaying = 2;

  sfJoystickCount = 8;
  sfJoystickButtonCount = 32;
  sfJoystickAxisCount = 8;

  sfJoystickX = 0;
  sfJoystickY = 1;
  sfJoystickZ = 2;
  sfJoystickR = 3;
  sfJoystickU = 4;
  sfJoystickV = 5;
  sfJoystickPovX = 6;
  sfJoystickPovY = 7;

  sfKeyUnknown = -1;
  sfKeyA = 0;
  sfKeyB = 1;
  sfKeyC = 2;
  sfKeyD = 3;
  sfKeyE = 4;
  sfKeyF = 5;
  sfKeyG = 6;
  sfKeyH = 7;
  sfKeyI = 8;
  sfKeyJ = 9;
  sfKeyK = 10;
  sfKeyL = 11;
  sfKeyM = 12;
  sfKeyN = 13;
  sfKeyO = 14;
  sfKeyP = 15;
  sfKeyQ = 16;
  sfKeyR = 17;
  sfKeyS = 18;
  sfKeyT = 19;
  sfKeyU = 20;
  sfKeyV = 21;
  sfKeyW = 22;
  sfKeyX = 23;
  sfKeyY = 24;
  sfKeyZ = 25;
  sfKeyNum0 = 26;
  sfKeyNum1 = 27;
  sfKeyNum2 = 28;
  sfKeyNum3 = 29;
  sfKeyNum4 = 30;
  sfKeyNum5 = 31;
  sfKeyNum6 = 32;
  sfKeyNum7 = 33;
  sfKeyNum8 = 34;
  sfKeyNum9 = 35;
  sfKeyEscape = 36;
  sfKeyLControl = 37;
  sfKeyLShift = 38;
  sfKeyLAlt = 39;
  sfKeyLSystem = 40;
  sfKeyRControl = 41;
  sfKeyRShift = 42;
  sfKeyRAlt = 43;
  sfKeyRSystem = 44;
  sfKeyMenu = 45;
  sfKeyLBracket = 46;
  sfKeyRBracket = 47;
  sfKeySemicolon = 48;
  sfKeyComma = 49;
  sfKeyPeriod = 50;
  sfKeyApostrophe = 51;
  sfKeySlash = 52;
  sfKeyBackslash = 53;
  sfKeyGrave = 54;
  sfKeyEqual = 55;
  sfKeyHyphen = 56;
  sfKeySpace = 57;
  sfKeyEnter = 58;
  sfKeyBackspace = 59;
  sfKeyTab = 60;
  sfKeyPageUp = 61;
  sfKeyPageDown = 62;
  sfKeyEnd = 63;
  sfKeyHome = 64;
  sfKeyInsert = 65;
  sfKeyDelete = 66;
  sfKeyAdd = 67;
  sfKeySubtract = 68;
  sfKeyMultiply = 69;
  sfKeyDivide = 70;
  sfKeyLeft = 71;
  sfKeyRight = 72;
  sfKeyUp = 73;
  sfKeyDown = 74;
  sfKeyNumpad0 = 75;
  sfKeyNumpad1 = 76;
  sfKeyNumpad2 = 77;
  sfKeyNumpad3 = 78;
  sfKeyNumpad4 = 79;
  sfKeyNumpad5 = 80;
  sfKeyNumpad6 = 81;
  sfKeyNumpad7 = 82;
  sfKeyNumpad8 = 83;
  sfKeyNumpad9 = 84;
  sfKeyF1 = 85;
  sfKeyF2 = 86;
  sfKeyF3 = 87;
  sfKeyF4 = 88;
  sfKeyF5 = 89;
  sfKeyF6 = 90;
  sfKeyF7 = 91;
  sfKeyF8 = 92;
  sfKeyF9 = 93;
  sfKeyF10 = 94;
  sfKeyF11 = 95;
  sfKeyF12 = 96;
  sfKeyF13 = 97;
  sfKeyF14 = 98;
  sfKeyF15 = 99;
  sfKeyPause = 100;
  sfKeyCount = 101;
  sfKeyTilde = 54;
  sfKeyDash = 56;
  sfKeyBack = 59;
  sfKeyReturn = 58;
  sfKeyQuote = 51;

  sfScanUnknown = -1;
  sfScanA = 0;
  sfScanB = 1;
  sfScanC = 2;
  sfScanD = 3;
  sfScanE = 4;
  sfScanF = 5;
  sfScanG = 6;
  sfScanH = 7;
  sfScanI = 8;
  sfScanJ = 9;
  sfScanK = 10;
  sfScanL = 11;
  sfScanM = 12;
  sfScanN = 13;
  sfScanO = 14;
  sfScanP = 15;
  sfScanQ = 16;
  sfScanR = 17;
  sfScanS = 18;
  sfScanT = 19;
  sfScanU = 20;
  sfScanV = 21;
  sfScanW = 22;
  sfScanX = 23;
  sfScanY = 24;
  sfScanZ = 25;
  sfScanNum1 = 26;
  sfScanNum2 = 27;
  sfScanNum3 = 28;
  sfScanNum4 = 29;
  sfScanNum5 = 30;
  sfScanNum6 = 31;
  sfScanNum7 = 32;
  sfScanNum8 = 33;
  sfScanNum9 = 34;
  sfScanNum0 = 35;
  sfScanEnter = 36;
  sfScanEscape = 37;
  sfScanBackspace = 38;
  sfScanTab = 39;
  sfScanSpace = 40;
  sfScanHyphen = 41;
  sfScanEqual = 42;
  sfScanLBracket = 43;
  sfScanRBracket = 44;
  sfScanBackslash = 45;
  sfScanSemicolon = 46;
  sfScanApostrophe = 47;
  sfScanGrave = 48;
  sfScanComma = 49;
  sfScanPeriod = 50;
  sfScanSlash = 51;
  sfScanF1 = 52;
  sfScanF2 = 53;
  sfScanF3 = 54;
  sfScanF4 = 55;
  sfScanF5 = 56;
  sfScanF6 = 57;
  sfScanF7 = 58;
  sfScanF8 = 59;
  sfScanF9 = 60;
  sfScanF10 = 61;
  sfScanF11 = 62;
  sfScanF12 = 63;
  sfScanF13 = 64;
  sfScanF14 = 65;
  sfScanF15 = 66;
  sfScanF16 = 67;
  sfScanF17 = 68;
  sfScanF18 = 69;
  sfScanF19 = 70;
  sfScanF20 = 71;
  sfScanF21 = 72;
  sfScanF22 = 73;
  sfScanF23 = 74;
  sfScanF24 = 75;
  sfScanCapsLock = 76;
  sfScanPrintScreen = 77;
  sfScanScrollLock = 78;
  sfScanPause = 79;
  sfScanInsert = 80;
  sfScanHome = 81;
  sfScanPageUp = 82;
  sfScanDelete = 83;
  sfScanEnd = 84;
  sfScanPageDown = 85;
  sfScanRight = 86;
  sfScanLeft = 87;
  sfScanDown = 88;
  sfScanUp = 89;
  sfScanNumLock = 90;
  sfScanNumpadDivide = 91;
  sfScanNumpadMultiply = 92;
  sfScanNumpadMinus = 93;
  sfScanNumpadPlus = 94;
  sfScanNumpadEqual = 95;
  sfScanNumpadEnter = 96;
  sfScanNumpadDecimal = 97;
  sfScanNumpad1 = 98;
  sfScanNumpad2 = 99;
  sfScanNumpad3 = 100;
  sfScanNumpad4 = 101;
  sfScanNumpad5 = 102;
  sfScanNumpad6 = 103;
  sfScanNumpad7 = 104;
  sfScanNumpad8 = 105;
  sfScanNumpad9 = 106;
  sfScanNumpad0 = 107;
  sfScanNonUsBackslash = 108;
  sfScanApplication = 109;
  sfScanExecute = 110;
  sfScanModeChange = 111;
  sfScanHelp = 112;
  sfScanMenu = 113;
  sfScanSelect = 114;
  sfScanRedo = 115;
  sfScanUndo = 116;
  sfScanCut = 117;
  sfScanCopy = 118;
  sfScanPaste = 119;
  sfScanVolumeMute = 120;
  sfScanVolumeUp = 121;
  sfScanVolumeDown = 122;
  sfScanMediaPlayPause = 123;
  sfScanMediaStop = 124;
  sfScanMediaNextTrack = 125;
  sfScanMediaPreviousTrack = 126;
  sfScanLControl = 127;
  sfScanLShift = 128;
  sfScanLAlt = 129;
  sfScanLSystem = 130;
  sfScanRControl = 131;
  sfScanRShift = 132;
  sfScanRAlt = 133;
  sfScanRSystem = 134;
  sfScanBack = 135;
  sfScanForward = 136;
  sfScanRefresh = 137;
  sfScanStop = 138;
  sfScanSearch = 139;
  sfScanFavorites = 140;
  sfScanHomePage = 141;
  sfScanLaunchApplication1 = 142;
  sfScanLaunchApplication2 = 143;
  sfScanLaunchMail = 144;
  sfScanLaunchMediaSelect = 145;
  sfScancodeCount = 146;

  sfMouseLeft = 0;
  sfMouseRight = 1;
  sfMouseMiddle = 2;
  sfMouseXButton1 = 3;
  sfMouseXButton2 = 4;
  sfMouseButtonCount = 5;

  sfMouseVerticalWheel = 0;
  sfMouseHorizontalWheel = 1;

  sfSensorAccelerometer = 0;
  sfSensorGyroscope = 1;
  sfSensorMagnetometer = 2;
  sfSensorGravity = 3;
  sfSensorUserAcceleration = 4;
  sfSensorOrientation = 5;
  sfSensorCount = 6;

  sfEvtClosed = 0;
  sfEvtResized = 1;
  sfEvtLostFocus = 2;
  sfEvtGainedFocus = 3;
  sfEvtTextEntered = 4;
  sfEvtKeyPressed = 5;
  sfEvtKeyReleased = 6;
  sfEvtMouseWheelMoved = 7;
  sfEvtMouseWheelScrolled = 8;
  sfEvtMouseButtonPressed = 9;
  sfEvtMouseButtonReleased = 10;
  sfEvtMouseMoved = 11;
  sfEvtMouseEntered = 12;
  sfEvtMouseLeft = 13;
  sfEvtJoystickButtonPressed = 14;
  sfEvtJoystickButtonReleased = 15;
  sfEvtJoystickMoved = 16;
  sfEvtJoystickConnected = 17;
  sfEvtJoystickDisconnected = 18;
  sfEvtTouchBegan = 19;
  sfEvtTouchMoved = 20;
  sfEvtTouchEnded = 21;
  sfEvtSensorChanged = 22;
  sfEvtCount = 23;

  sfNone = 0;
  sfTitlebar = 1;
  sfResize = 2;
  sfClose = 4;
  sfFullscreen = 8;
  sfDefaultStyle = 7;

  sfContextDefault = 0;
  sfContextCore = 1;
  sfContextDebug = 4;

  sfCursorArrow = 0;
  sfCursorArrowWait = 1;
  sfCursorWait = 2;
  sfCursorText = 3;
  sfCursorHand = 4;
  sfCursorSizeHorizontal = 5;
  sfCursorSizeVertical = 6;
  sfCursorSizeTopLeftBottomRight = 7;
  sfCursorSizeBottomLeftTopRight = 8;
  sfCursorSizeLeft = 9;
  sfCursorSizeRight = 10;
  sfCursorSizeTop = 11;
  sfCursorSizeBottom = 12;
  sfCursorSizeTopLeft = 13;
  sfCursorSizeBottomRight = 14;
  sfCursorSizeBottomLeft = 15;
  sfCursorSizeTopRight = 16;
  sfCursorSizeAll = 17;
  sfCursorCross = 18;
  sfCursorHelp = 19;
  sfCursorNotAllowed = 20;

  sfBlendFactorZero = 0;
  sfBlendFactorOne = 1;
  sfBlendFactorSrcColor = 2;
  sfBlendFactorOneMinusSrcColor = 3;
  sfBlendFactorDstColor = 4;
  sfBlendFactorOneMinusDstColor = 5;
  sfBlendFactorSrcAlpha = 6;
  sfBlendFactorOneMinusSrcAlpha = 7;
  sfBlendFactorDstAlpha = 8;
  sfBlendFactorOneMinusDstAlpha = 9;

  sfBlendEquationAdd = 0;
  sfBlendEquationSubtract = 1;
  sfBlendEquationReverseSubtract = 2;
  sfBlendEquationMin = 3;
  sfBlendEquationMax = 4;

  sfPoints = 0;
  sfLines = 1;
  sfLineStrip = 2;
  sfTriangles = 3;
  sfTriangleStrip = 4;
  sfTriangleFan = 5;
  sfQuads = 6;
  sfLinesStrip = 2;
  sfTrianglesStrip = 4;
  sfTrianglesFan = 5;

  sfTextRegular = 0;
  sfTextBold = 1;
  sfTextItalic = 2;
  sfTextUnderlined = 4;
  sfTextStrikeThrough = 8;

  sfTextureNormalized = 0;
  sfTexturePixels = 1;

  sfVertexBufferStream = 0;
  sfVertexBufferDynamic = 1;
  sfVertexBufferStatic = 2;

  sfFtpBinary = 0;
  sfFtpAscii = 1;
  sfFtpEbcdic = 2;

  sfFtpRestartMarkerReply = 110;
  sfFtpServiceReadySoon = 120;
  sfFtpDataConnectionAlreadyOpened = 125;
  sfFtpOpeningDataConnection = 150;
  sfFtpOk = 200;
  sfFtpPointlessCommand = 202;
  sfFtpSystemStatus = 211;
  sfFtpDirectoryStatus = 212;
  sfFtpFileStatus = 213;
  sfFtpHelpMessage = 214;
  sfFtpSystemType = 215;
  sfFtpServiceReady = 220;
  sfFtpClosingConnection = 221;
  sfFtpDataConnectionOpened = 225;
  sfFtpClosingDataConnection = 226;
  sfFtpEnteringPassiveMode = 227;
  sfFtpLoggedIn = 230;
  sfFtpFileActionOk = 250;
  sfFtpDirectoryOk = 257;
  sfFtpNeedPassword = 331;
  sfFtpNeedAccountToLogIn = 332;
  sfFtpNeedInformation = 350;
  sfFtpServiceUnavailable = 421;
  sfFtpDataConnectionUnavailable = 425;
  sfFtpTransferAborted = 426;
  sfFtpFileActionAborted = 450;
  sfFtpLocalError = 451;
  sfFtpInsufficientStorageSpace = 452;
  sfFtpCommandUnknown = 500;
  sfFtpParametersUnknown = 501;
  sfFtpCommandNotImplemented = 502;
  sfFtpBadCommandSequence = 503;
  sfFtpParameterNotImplemented = 504;
  sfFtpNotLoggedIn = 530;
  sfFtpNeedAccountToStore = 532;
  sfFtpFileUnavailable = 550;
  sfFtpPageTypeUnknown = 551;
  sfFtpNotEnoughMemory = 552;
  sfFtpFilenameNotAllowed = 553;
  sfFtpInvalidResponse = 1000;
  sfFtpConnectionFailed = 1001;
  sfFtpConnectionClosed = 1002;
  sfFtpInvalidFile = 1003;

  sfHttpGet = 0;
  sfHttpPost = 1;
  sfHttpHead = 2;
  sfHttpPut = 3;
  sfHttpDelete = 4;

  sfHttpOk = 200;
  sfHttpCreated = 201;
  sfHttpAccepted = 202;
  sfHttpNoContent = 204;
  sfHttpResetContent = 205;
  sfHttpPartialContent = 206;
  sfHttpMultipleChoices = 300;
  sfHttpMovedPermanently = 301;
  sfHttpMovedTemporarily = 302;
  sfHttpNotModified = 304;
  sfHttpBadRequest = 400;
  sfHttpUnauthorized = 401;
  sfHttpForbidden = 403;
  sfHttpNotFound = 404;
  sfHttpRangeNotSatisfiable = 407;
  sfHttpInternalServerError = 500;
  sfHttpNotImplemented = 501;
  sfHttpBadGateway = 502;
  sfHttpServiceNotAvailable = 503;
  sfHttpGatewayTimeout = 504;
  sfHttpVersionNotSupported = 505;
  sfHttpInvalidResponse = 1000;
  sfHttpConnectionFailed = 1001;

  sfSocketDone = 0;
  sfSocketNotReady = 1;
  sfSocketPartial = 2;
  sfSocketDisconnected = 3;
  sfSocketError = 4;
{$ENDREGION}

{$REGION ' Types '}
type
  sfSoundStatus = Integer;
  PsfSoundStatus = ^sfSoundStatus;

  sfJoystickAxis = Integer;
  PsfJoystickAxis = ^sfJoystickAxis;

  sfKeyCode = Integer;
  PsfKeyCode = ^sfKeyCode;

  sfScancode = Integer;
  PsfScancode = ^sfScancode;

  sfMouseButton = Integer;
  PsfMouseButton = ^sfMouseButton;

  sfMouseWheel = Integer;
  PsfMouseWheel = ^sfMouseWheel;

  sfSensorType = Integer;
  PsfSensorType = ^sfSensorType;

  sfEventType = Integer;
  PsfEventType = ^sfEventType;

  sfWindowStyle = Integer;
  PsfWindowStyle = ^sfWindowStyle;

  sfContextAttribute = Integer;
  PsfContextAttribute = ^sfContextAttribute;

  sfCursorType = Integer;
  PsfCursorType = ^sfCursorType;

  sfBlendFactor = Integer;
  PsfBlendFactor = ^sfBlendFactor;

  sfBlendEquation = Integer;
  PsfBlendEquation = ^sfBlendEquation;

  sfPrimitiveType = Integer;
  PsfPrimitiveType = ^sfPrimitiveType;

  sfTextStyle = Integer;
  PsfTextStyle = ^sfTextStyle;

  sfTextureCoordinateType = Integer;
  PsfTextureCoordinateType = ^sfTextureCoordinateType;

  sfVertexBufferUsage = Integer;
  PsfVertexBufferUsage = ^sfVertexBufferUsage;

  sfFtpTransferMode = Integer;
  PsfFtpTransferMode = ^sfFtpTransferMode;

  sfFtpStatus = Integer;
  PsfFtpStatus = ^sfFtpStatus;

  sfHttpMethod = Integer;
  PsfHttpMethod = ^sfHttpMethod;

  sfHttpStatus = Integer;
  PsfHttpStatus = ^sfHttpStatus;

  sfSocketStatus = Integer;
  PsfSocketStatus = ^sfSocketStatus;

  PPUTF8Char = ^PUTF8Char;
  PWideChar = ^WideChar;
  PNativeUInt = ^NativeUInt;
  PHWND__ = Pointer;
  PPHWND__ = ^PHWND__;
  PsfTime = ^sfTime;
  PsfInputStream = ^sfInputStream;
  PsfVector2i = ^sfVector2i;
  PsfVector2u = ^sfVector2u;
  PsfVector2f = ^sfVector2f;
  PsfVector3f = ^sfVector3f;
  PsfTimeSpan = ^sfTimeSpan;
  PsfSoundStreamChunk = ^sfSoundStreamChunk;
  PsfJoystickIdentification = ^sfJoystickIdentification;
  PsfKeyEvent = ^sfKeyEvent;
  PsfTextEvent = ^sfTextEvent;
  PsfMouseMoveEvent = ^sfMouseMoveEvent;
  PsfMouseButtonEvent = ^sfMouseButtonEvent;
  PsfMouseWheelEvent = ^sfMouseWheelEvent;
  PsfMouseWheelScrollEvent = ^sfMouseWheelScrollEvent;
  PsfJoystickMoveEvent = ^sfJoystickMoveEvent;
  PsfJoystickButtonEvent = ^sfJoystickButtonEvent;
  PsfJoystickConnectEvent = ^sfJoystickConnectEvent;
  PsfSizeEvent = ^sfSizeEvent;
  PsfTouchEvent = ^sfTouchEvent;
  PsfSensorEvent = ^sfSensorEvent;
  PsfVideoMode = ^sfVideoMode;
  PsfContextSettings = ^sfContextSettings;
  PsfBlendMode = ^sfBlendMode;
  PsfColor = ^sfColor;
  PsfFloatRect = ^sfFloatRect;
  PsfIntRect = ^sfIntRect;
  PsfTransform = ^sfTransform;
  PsfFontInfo = ^sfFontInfo;
  PsfGlyph = ^sfGlyph;
  PsfRenderStates = ^sfRenderStates;
  PsfVertex = ^sfVertex;
  PsfGlslBvec2 = ^sfGlslBvec2;
  PsfGlslIvec3 = ^sfGlslIvec3;
  PsfGlslBvec3 = ^sfGlslBvec3;
  PsfGlslVec4 = ^sfGlslVec4;
  PsfGlslIvec4 = ^sfGlslIvec4;
  PsfGlslBvec4 = ^sfGlslBvec4;
  PsfGlslMat3 = ^sfGlslMat3;
  PsfGlslMat4 = ^sfGlslMat4;
  PsfIpAddress = ^sfIpAddress;

  sfBool = Integer;
  sfInt8 = UTF8Char;
  sfUint8 = Byte;
  PsfUint8 = ^sfUint8;
  sfInt16 = Smallint;
  PsfInt16 = ^sfInt16;
  sfUint16 = Word;
  sfInt32 = Integer;
  sfUint32 = Cardinal;
  PsfUint32 = ^sfUint32;
  sfInt64 = Int64;
  sfUint64 = UInt64;

  sfTime = record
    microseconds: sfInt64;
  end;

  PsfClock = Pointer;
  PPsfClock = ^PsfClock;
  PsfMutex = Pointer;
  PPsfMutex = ^PsfMutex;
  PsfThread = Pointer;
  PPsfThread = ^PsfThread;

  sfInputStreamReadFunc = function(data: Pointer; size: sfInt64; userData: Pointer): sfInt64; cdecl;
  sfInputStreamSeekFunc = function(position: sfInt64; userData: Pointer): sfInt64; cdecl;
  sfInputStreamTellFunc = function(userData: Pointer): sfInt64; cdecl;
  sfInputStreamGetSizeFunc = function(userData: Pointer): sfInt64; cdecl;

  sfInputStream = record
    read: sfInputStreamReadFunc;
    seek: sfInputStreamSeekFunc;
    tell: sfInputStreamTellFunc;
    getSize: sfInputStreamGetSizeFunc;
    userData: Pointer;
  end;

  sfVector2i = record
    x: Integer;
    y: Integer;
  end;

  sfVector2u = record
    x: Cardinal;
    y: Cardinal;
  end;

  sfVector2f = record
    x: Single;
    y: Single;
  end;

  sfVector3f = record
    x: Single;
    y: Single;
    z: Single;
  end;

  PsfMusic = Pointer;
  PPsfMusic = ^PsfMusic;
  PsfSound = Pointer;
  PPsfSound = ^PsfSound;
  PsfSoundBuffer = Pointer;
  PPsfSoundBuffer = ^PsfSoundBuffer;
  PsfSoundBufferRecorder = Pointer;
  PPsfSoundBufferRecorder = ^PsfSoundBufferRecorder;
  PsfSoundRecorder = Pointer;
  PPsfSoundRecorder = ^PsfSoundRecorder;
  PsfSoundStream = Pointer;
  PPsfSoundStream = ^PsfSoundStream;

  sfTimeSpan = record
    offset: sfTime;
    length: sfTime;
  end;

  sfSoundRecorderStartCallback = function(p1: Pointer): sfBool; cdecl;
  sfSoundRecorderProcessCallback = function(const p1: PsfInt16; p2: NativeUInt; p3: Pointer): sfBool; cdecl;
  sfSoundRecorderStopCallback = procedure(p1: Pointer); cdecl;

  sfSoundStreamChunk = record
    samples: PsfInt16;
    sampleCount: Cardinal;
  end;

  sfSoundStreamGetDataCallback = function(p1: PsfSoundStreamChunk; p2: Pointer): sfBool; cdecl;

  sfSoundStreamSeekCallback = procedure(p1: sfTime; p2: Pointer); cdecl;
  PsfContext = Pointer;
  PPsfContext = ^PsfContext;
  PsfCursor = Pointer;
  PPsfCursor = ^PsfCursor;
  PsfWindow = Pointer;
  PPsfWindow = ^PsfWindow;

  sfJoystickIdentification = record
    name: PUTF8Char;
    vendorId: Cardinal;
    productId: Cardinal;
  end;

  sfKeyEvent = record
    type_: sfEventType;
    code: sfKeyCode;
    scancode: sfScancode;
    alt: sfBool;
    control: sfBool;
    shift: sfBool;
    system: sfBool;
  end;

  sfTextEvent = record
    type_: sfEventType;
    unicode: sfUint32;
  end;

  sfMouseMoveEvent = record
    type_: sfEventType;
    x: Integer;
    y: Integer;
  end;

  sfMouseButtonEvent = record
    type_: sfEventType;
    button: sfMouseButton;
    x: Integer;
    y: Integer;
  end;

  sfMouseWheelEvent = record
    type_: sfEventType;
    delta: Integer;
    x: Integer;
    y: Integer;
  end;

  sfMouseWheelScrollEvent = record
    type_: sfEventType;
    wheel: sfMouseWheel;
    delta: Single;
    x: Integer;
    y: Integer;
  end;

  sfJoystickMoveEvent = record
    type_: sfEventType;
    joystickId: Cardinal;
    axis: sfJoystickAxis;
    position: Single;
  end;

  sfJoystickButtonEvent = record
    type_: sfEventType;
    joystickId: Cardinal;
    button: Cardinal;
  end;

  sfJoystickConnectEvent = record
    type_: sfEventType;
    joystickId: Cardinal;
  end;

  sfSizeEvent = record
    type_: sfEventType;
    width: Cardinal;
    height: Cardinal;
  end;

  sfTouchEvent = record
    type_: sfEventType;
    finger: Cardinal;
    x: Integer;
    y: Integer;
  end;

  sfSensorEvent = record
    type_: sfEventType;
    sensorType: sfSensorType;
    x: Single;
    y: Single;
    z: Single;
  end;

  PsfEvent = ^sfEvent;
  sfEvent = record
    case Integer of
      0: (type_: sfEventType);
      1: (size: sfSizeEvent);
      2: (key: sfKeyEvent);
      3: (text: sfTextEvent);
      4: (mouseMove: sfMouseMoveEvent);
      5: (mouseButton: sfMouseButtonEvent);
      6: (mouseWheel: sfMouseWheelEvent);
      7: (mouseWheelScroll: sfMouseWheelScrollEvent);
      8: (joystickMove: sfJoystickMoveEvent);
      9: (joystickButton: sfJoystickButtonEvent);
      10: (joystickConnect: sfJoystickConnectEvent);
      11: (touch: sfTouchEvent);
      12: (sensor: sfSensorEvent);
  end;

  sfVideoMode = record
    width: Cardinal;
    height: Cardinal;
    bitsPerPixel: Cardinal;
  end;

  sfWindowHandle = Pointer;
  PsfWindowHandle = ^sfWindowHandle;

  sfContextSettings = record
    depthBits: Cardinal;
    stencilBits: Cardinal;
    antialiasingLevel: Cardinal;
    majorVersion: Cardinal;
    minorVersion: Cardinal;
    attributeFlags: sfUint32;
    sRgbCapable: sfBool;
  end;

  GlFunctionPointer = procedure(); cdecl;

  sfBlendMode = record
    colorSrcFactor: sfBlendFactor;
    colorDstFactor: sfBlendFactor;
    colorEquation: sfBlendEquation;
    alphaSrcFactor: sfBlendFactor;
    alphaDstFactor: sfBlendFactor;
    alphaEquation: sfBlendEquation;
  end;

  sfColor = record
    r: sfUint8;
    g: sfUint8;
    b: sfUint8;
    a: sfUint8;
  end;

  sfFloatRect = record
    left: Single;
    top: Single;
    width: Single;
    height: Single;
  end;

  sfIntRect = record
    left: Integer;
    top: Integer;
    width: Integer;
    height: Integer;
  end;

  PsfCircleShape = Pointer;
  PPsfCircleShape = ^PsfCircleShape;
  PsfConvexShape = Pointer;
  PPsfConvexShape = ^PsfConvexShape;
  PsfFont = Pointer;
  PPsfFont = ^PsfFont;
  PsfImage = Pointer;
  PPsfImage = ^PsfImage;
  PsfShader = Pointer;
  PPsfShader = ^PsfShader;
  PsfRectangleShape = Pointer;
  PPsfRectangleShape = ^PsfRectangleShape;
  PsfRenderTexture = Pointer;
  PPsfRenderTexture = ^PsfRenderTexture;
  PsfRenderWindow = Pointer;
  PPsfRenderWindow = ^PsfRenderWindow;
  PsfShape = Pointer;
  PPsfShape = ^PsfShape;
  PsfSprite = Pointer;
  PPsfSprite = ^PsfSprite;
  PsfText = Pointer;
  PPsfText = ^PsfText;
  PsfTexture = Pointer;
  PPsfTexture = ^PsfTexture;
  PsfTransformable = Pointer;
  PPsfTransformable = ^PsfTransformable;
  PsfVertexArray = Pointer;
  PPsfVertexArray = ^PsfVertexArray;
  PsfVertexBuffer = Pointer;
  PPsfVertexBuffer = ^PsfVertexBuffer;
  PsfView = Pointer;
  PPsfView = ^PsfView;

  sfTransform = record
    matrix: array [0..8] of Single;
  end;

  sfFontInfo = record
    family: PUTF8Char;
  end;

  sfGlyph = record
    advance: Single;
    bounds: sfFloatRect;
    textureRect: sfIntRect;
  end;

  sfRenderStates = record
    blendMode: sfBlendMode;
    transform: sfTransform;
    texture: PsfTexture;
    shader: PsfShader;
  end;

  sfVertex = record
    position: sfVector2f;
    color: sfColor;
    texCoords: sfVector2f;
  end;

  sfGlslVec2 = sfVector2f;
  PsfGlslVec2 = ^sfGlslVec2;
  sfGlslIvec2 = sfVector2i;

  sfGlslBvec2 = record
    x: sfBool;
    y: sfBool;
  end;

  sfGlslVec3 = sfVector3f;
  PsfGlslVec3 = ^sfGlslVec3;

  sfGlslIvec3 = record
    x: Integer;
    y: Integer;
    z: Integer;
  end;

  sfGlslBvec3 = record
    x: sfBool;
    y: sfBool;
    z: sfBool;
  end;

  sfGlslVec4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  sfGlslIvec4 = record
    x: Integer;
    y: Integer;
    z: Integer;
    w: Integer;
  end;

  sfGlslBvec4 = record
    x: sfBool;
    y: sfBool;
    z: sfBool;
    w: sfBool;
  end;

  sfGlslMat3 = record
    array_: array [0..8] of Single;
  end;

  sfGlslMat4 = record
    array_: array [0..15] of Single;
  end;

  sfShapeGetPointCountCallback = function(p1: Pointer): NativeUInt; cdecl;
  sfShapeGetPointCallback = function(p1: NativeUInt; p2: Pointer): sfVector2f; cdecl;

  sfIpAddress = record
    address: array [0..15] of UTF8Char;
  end;

  PsfFtpDirectoryResponse = Pointer;
  PPsfFtpDirectoryResponse = ^PsfFtpDirectoryResponse;
  PsfFtpListingResponse = Pointer;
  PPsfFtpListingResponse = ^PsfFtpListingResponse;
  PsfFtpResponse = Pointer;
  PPsfFtpResponse = ^PsfFtpResponse;
  PsfFtp = Pointer;
  PPsfFtp = ^PsfFtp;
  PsfHttpRequest = Pointer;
  PPsfHttpRequest = ^PsfHttpRequest;
  PsfHttpResponse = Pointer;
  PPsfHttpResponse = ^PsfHttpResponse;
  PsfHttp = Pointer;
  PPsfHttp = ^PsfHttp;
  PsfPacket = Pointer;
  PPsfPacket = ^PsfPacket;
  PsfSocketSelector = Pointer;
  PPsfSocketSelector = ^PsfSocketSelector;
  PsfTcpListener = Pointer;
  PPsfTcpListener = ^PsfTcpListener;
  PsfTcpSocket = Pointer;
  PPsfTcpSocket = ^PsfTcpSocket;
  PsfUdpSocket = Pointer;
  PPsfUdpSocket = ^PsfUdpSocket;

  sfThread_create_function = procedure(p1: Pointer); cdecl;
{$ENDREGION}

{$REGION ' Common Colors '}
const
  ALICEBLUE           : sfColor = (r:$F0; g:$F8; b:$FF; a:$FF);
  ANTIQUEWHITE        : sfColor = (r:$FA; g:$EB; b:$D7; a:$FF);
  AQUA                : sfColor = (r:$00; g:$FF; b:$FF; a:$FF);
  AQUAMARINE          : sfColor = (r:$7F; g:$FF; b:$D4; a:$FF);
  AZURE               : sfColor = (r:$F0; g:$FF; b:$FF; a:$FF);
  BEIGE               : sfColor = (r:$F5; g:$F5; b:$DC; a:$FF);
  BISQUE              : sfColor = (r:$FF; g:$E4; b:$C4; a:$FF);
  BLACK               : sfColor = (r:$00; g:$00; b:$00; a:$FF);
  BLANCHEDALMOND      : sfColor = (r:$FF; g:$EB; b:$CD; a:$FF);
  BLUE                : sfColor = (r:$00; g:$00; b:$FF; a:$FF);
  BLUEVIOLET          : sfColor = (r:$8A; g:$2B; b:$E2; a:$FF);
  BROWN               : sfColor = (r:$A5; g:$2A; b:$2A; a:$FF);
  BURLYWOOD           : sfColor = (r:$DE; g:$B8; b:$87; a:$FF);
  CADETBLUE           : sfColor = (r:$5F; g:$9E; b:$A0; a:$FF);
  CHARTREUSE          : sfColor = (r:$7F; g:$FF; b:$00; a:$FF);
  CHOCOLATE           : sfColor = (r:$D2; g:$69; b:$1E; a:$FF);
  CORAL               : sfColor = (r:$FF; g:$7F; b:$50; a:$FF);
  CORNFLOWERBLUE      : sfColor = (r:$64; g:$95; b:$ED; a:$FF);
  CORNSILK            : sfColor = (r:$FF; g:$F8; b:$DC; a:$FF);
  CRIMSON             : sfColor = (r:$DC; g:$14; b:$3C; a:$FF);
  CYAN                : sfColor = (r:$00; g:$FF; b:$FF; a:$FF);
  DARKBLUE            : sfColor = (r:$00; g:$00; b:$8B; a:$FF);
  DARKCYAN            : sfColor = (r:$00; g:$8B; b:$8B; a:$FF);
  DARKGOLDENROD       : sfColor = (r:$B8; g:$86; b:$0B; a:$FF);
  DARKGRAY            : sfColor = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKGREEN           : sfColor = (r:$00; g:$64; b:$00; a:$FF);
  DARKGREY            : sfColor = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKKHAKI           : sfColor = (r:$BD; g:$B7; b:$6B; a:$FF);
  DARKMAGENTA         : sfColor = (r:$8B; g:$00; b:$8B; a:$FF);
  DARKOLIVEGREEN      : sfColor = (r:$55; g:$6B; b:$2F; a:$FF);
  DARKORANGE          : sfColor = (r:$FF; g:$8C; b:$00; a:$FF);
  DARKORCHID          : sfColor = (r:$99; g:$32; b:$CC; a:$FF);
  DARKRED             : sfColor = (r:$8B; g:$00; b:$00; a:$FF);
  DARKSALMON          : sfColor = (r:$E9; g:$96; b:$7A; a:$FF);
  DARKSEAGREEN        : sfColor = (r:$8F; g:$BC; b:$8F; a:$FF);
  DARKSLATEBLUE       : sfColor = (r:$48; g:$3D; b:$8B; a:$FF);
  DARKSLATEGRAY       : sfColor = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKSLATEGREY       : sfColor = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKTURQUOISE       : sfColor = (r:$00; g:$CE; b:$D1; a:$FF);
  DARKVIOLET          : sfColor = (r:$94; g:$00; b:$D3; a:$FF);
  DEEPPINK            : sfColor = (r:$FF; g:$14; b:$93; a:$FF);
  DEEPSKYBLUE         : sfColor = (r:$00; g:$BF; b:$FF; a:$FF);
  DIMGRAY             : sfColor = (r:$69; g:$69; b:$69; a:$FF);
  DIMGREY             : sfColor = (r:$69; g:$69; b:$69; a:$FF);
  DODGERBLUE          : sfColor = (r:$1E; g:$90; b:$FF; a:$FF);
  FIREBRICK           : sfColor = (r:$B2; g:$22; b:$22; a:$FF);
  FLORALWHITE         : sfColor = (r:$FF; g:$FA; b:$F0; a:$FF);
  FORESTGREEN         : sfColor = (r:$22; g:$8B; b:$22; a:$FF);
  FUCHSIA             : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  GAINSBORO           : sfColor = (r:$DC; g:$DC; b:$DC; a:$FF);
  GHOSTWHITE          : sfColor = (r:$F8; g:$F8; b:$FF; a:$FF);
  GOLD                : sfColor = (r:$FF; g:$D7; b:$00; a:$FF);
  GOLDENROD           : sfColor = (r:$DA; g:$A5; b:$20; a:$FF);
  GRAY                : sfColor = (r:$80; g:$80; b:$80; a:$FF);
  GREEN               : sfColor = (r:$00; g:$80; b:$00; a:$FF);
  GREENYELLOW         : sfColor = (r:$AD; g:$FF; b:$2F; a:$FF);
  GREY                : sfColor = (r:$80; g:$80; b:$80; a:$FF);
  HONEYDEW            : sfColor = (r:$F0; g:$FF; b:$F0; a:$FF);
  HOTPINK             : sfColor = (r:$FF; g:$69; b:$B4; a:$FF);
  INDIANRED           : sfColor = (r:$CD; g:$5C; b:$5C; a:$FF);
  INDIGO              : sfColor = (r:$4B; g:$00; b:$82; a:$FF);
  IVORY               : sfColor = (r:$FF; g:$FF; b:$F0; a:$FF);
  KHAKI               : sfColor = (r:$F0; g:$E6; b:$8C; a:$FF);
  LAVENDER            : sfColor = (r:$E6; g:$E6; b:$FA; a:$FF);
  LAVENDERBLUSH       : sfColor = (r:$FF; g:$F0; b:$F5; a:$FF);
  LAWNGREEN           : sfColor = (r:$7C; g:$FC; b:$00; a:$FF);
  LEMONCHIFFON        : sfColor = (r:$FF; g:$FA; b:$CD; a:$FF);
  LIGHTBLUE           : sfColor = (r:$AD; g:$D8; b:$E6; a:$FF);
  LIGHTCORAL          : sfColor = (r:$F0; g:$80; b:$80; a:$FF);
  LIGHTCYAN           : sfColor = (r:$E0; g:$FF; b:$FF; a:$FF);
  LIGHTGOLDENRODYELLOW: sfColor = (r:$FA; g:$FA; b:$D2; a:$FF);
  LIGHTGRAY           : sfColor = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTGREEN          : sfColor = (r:$90; g:$EE; b:$90; a:$FF);
  LIGHTGREY           : sfColor = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTPINK           : sfColor = (r:$FF; g:$B6; b:$C1; a:$FF);
  LIGHTSALMON         : sfColor = (r:$FF; g:$A0; b:$7A; a:$FF);
  LIGHTSEAGREEN       : sfColor = (r:$20; g:$B2; b:$AA; a:$FF);
  LIGHTSKYBLUE        : sfColor = (r:$87; g:$CE; b:$FA; a:$FF);
  LIGHTSLATEGRAY      : sfColor = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSLATEGREY      : sfColor = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSTEELBLUE      : sfColor = (r:$B0; g:$C4; b:$DE; a:$FF);
  LIGHTYELLOW         : sfColor = (r:$FF; g:$FF; b:$E0; a:$FF);
  LIME                : sfColor = (r:$00; g:$FF; b:$00; a:$FF);
  LIMEGREEN           : sfColor = (r:$32; g:$CD; b:$32; a:$FF);
  LINEN               : sfColor = (r:$FA; g:$F0; b:$E6; a:$FF);
  MAGENTA             : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  MAROON              : sfColor = (r:$80; g:$00; b:$00; a:$FF);
  MEDIUMAQUAMARINE    : sfColor = (r:$66; g:$CD; b:$AA; a:$FF);
  MEDIUMBLUE          : sfColor = (r:$00; g:$00; b:$CD; a:$FF);
  MEDIUMORCHID        : sfColor = (r:$BA; g:$55; b:$D3; a:$FF);
  MEDIUMPURPLE        : sfColor = (r:$93; g:$70; b:$DB; a:$FF);
  MEDIUMSEAGREEN      : sfColor = (r:$3C; g:$B3; b:$71; a:$FF);
  MEDIUMSLATEBLUE     : sfColor = (r:$7B; g:$68; b:$EE; a:$FF);
  MEDIUMSPRINGGREEN   : sfColor = (r:$00; g:$FA; b:$9A; a:$FF);
  MEDIUMTURQUOISE     : sfColor = (r:$48; g:$D1; b:$CC; a:$FF);
  MEDIUMVIOLETRED     : sfColor = (r:$C7; g:$15; b:$85; a:$FF);
  MIDNIGHTBLUE        : sfColor = (r:$19; g:$19; b:$70; a:$FF);
  MINTCREAM           : sfColor = (r:$F5; g:$FF; b:$FA; a:$FF);
  MISTYROSE           : sfColor = (r:$FF; g:$E4; b:$E1; a:$FF);
  MOCCASIN            : sfColor = (r:$FF; g:$E4; b:$B5; a:$FF);
  NAVAJOWHITE         : sfColor = (r:$FF; g:$DE; b:$AD; a:$FF);
  NAVY                : sfColor = (r:$00; g:$00; b:$80; a:$FF);
  OLDLACE             : sfColor = (r:$FD; g:$F5; b:$E6; a:$FF);
  OLIVE               : sfColor = (r:$80; g:$80; b:$00; a:$FF);
  OLIVEDRAB           : sfColor = (r:$6B; g:$8E; b:$23; a:$FF);
  ORANGE              : sfColor = (r:$FF; g:$A5; b:$00; a:$FF);
  ORANGERED           : sfColor = (r:$FF; g:$45; b:$00; a:$FF);
  ORCHID              : sfColor = (r:$DA; g:$70; b:$D6; a:$FF);
  PALEGOLDENROD       : sfColor = (r:$EE; g:$E8; b:$AA; a:$FF);
  PALEGREEN           : sfColor = (r:$98; g:$FB; b:$98; a:$FF);
  PALETURQUOISE       : sfColor = (r:$AF; g:$EE; b:$EE; a:$FF);
  PALEVIOLETRED       : sfColor = (r:$DB; g:$70; b:$93; a:$FF);
  PAPAYAWHIP          : sfColor = (r:$FF; g:$EF; b:$D5; a:$FF);
  PEACHPUFF           : sfColor = (r:$FF; g:$DA; b:$B9; a:$FF);
  PERU                : sfColor = (r:$CD; g:$85; b:$3F; a:$FF);
  PINK                : sfColor = (r:$FF; g:$C0; b:$CB; a:$FF);
  PLUM                : sfColor = (r:$DD; g:$A0; b:$DD; a:$FF);
  POWDERBLUE          : sfColor = (r:$B0; g:$E0; b:$E6; a:$FF);
  PURPLE              : sfColor = (r:$80; g:$00; b:$80; a:$FF);
  REBECCAPURPLE       : sfColor = (r:$66; g:$33; b:$99; a:$FF);
  RED                 : sfColor = (r:$FF; g:$00; b:$00; a:$FF);
  ROSYBROWN           : sfColor = (r:$BC; g:$8F; b:$8F; a:$FF);
  ROYALBLUE           : sfColor = (r:$41; g:$69; b:$E1; a:$FF);
  SADDLEBROWN         : sfColor = (r:$8B; g:$45; b:$13; a:$FF);
  SALMON              : sfColor = (r:$FA; g:$80; b:$72; a:$FF);
  SANDYBROWN          : sfColor = (r:$F4; g:$A4; b:$60; a:$FF);
  SEAGREEN            : sfColor = (r:$2E; g:$8B; b:$57; a:$FF);
  SEASHELL            : sfColor = (r:$FF; g:$F5; b:$EE; a:$FF);
  SIENNA              : sfColor = (r:$A0; g:$52; b:$2D; a:$FF);
  SILVER              : sfColor = (r:$C0; g:$C0; b:$C0; a:$FF);
  SKYBLUE             : sfColor = (r:$87; g:$CE; b:$EB; a:$FF);
  SLATEBLUE           : sfColor = (r:$6A; g:$5A; b:$CD; a:$FF);
  SLATEGRAY           : sfColor = (r:$70; g:$80; b:$90; a:$FF);
  SLATEGREY           : sfColor = (r:$70; g:$80; b:$90; a:$FF);
  SNOW                : sfColor = (r:$FF; g:$FA; b:$FA; a:$FF);
  SPRINGGREEN         : sfColor = (r:$00; g:$FF; b:$7F; a:$FF);
  STEELBLUE           : sfColor = (r:$46; g:$82; b:$B4; a:$FF);
  TAN                 : sfColor = (r:$D2; g:$B4; b:$8C; a:$FF);
  TEAL                : sfColor = (r:$00; g:$80; b:$80; a:$FF);
  THISTLE             : sfColor = (r:$D8; g:$BF; b:$D8; a:$FF);
  TOMATO              : sfColor = (r:$FF; g:$63; b:$47; a:$FF);
  TURQUOISE           : sfColor = (r:$40; g:$E0; b:$D0; a:$FF);
  VIOLET              : sfColor = (r:$EE; g:$82; b:$EE; a:$FF);
  WHEAT               : sfColor = (r:$F5; g:$DE; b:$B3; a:$FF);
  WHITE               : sfColor = (r:$FF; g:$FF; b:$FF; a:$FF);
  WHITESMOKE          : sfColor = (r:$F5; g:$F5; b:$F5; a:$FF);
  YELLOW              : sfColor = (r:$FF; g:$FF; b:$00; a:$FF);
  YELLOWGREEN         : sfColor = (r:$9A; g:$CD; b:$32; a:$FF);
  BLANK               : sfColor = (r:$00; g:$00; b:$00; a:$00);
  WHITE2              : sfColor = (r:$F5; g:$F5; b:$F5; a:$FF);
  RED22               : sfColor = (r:$7E; g:$32; b:$3F; a:255);
  COLORKEY            : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  OVERLAY1            : sfColor = (r:$00; g:$20; b:$29; a:$B4);
  OVERLAY2            : sfColor = (r:$01; g:$1B; b:$01; a:255);
  DIMWHITE            : sfColor = (r:$10; g:$10; b:$10; a:$10);
  DARKSLATEBROWN      : sfColor = (r:30;  g:31;  b:30;  a:1);
  RAYWHITE            : sfColor = (r:245; g:245; b:245; a:255);
{$ENDREGION}

{$REGION ' Exports '}
var
  sfTime_asSeconds: function(time: sfTime): Single; cdecl;
  sfTime_asMilliseconds: function(time: sfTime): sfInt32; cdecl;
  sfTime_asMicroseconds: function(time: sfTime): sfInt64; cdecl;
  sfSeconds: function(amount: Single): sfTime; cdecl;
  sfMilliseconds: function(amount: sfInt32): sfTime; cdecl;
  sfMicroseconds: function(amount: sfInt64): sfTime; cdecl;
  sfClock_create: function(): PsfClock; cdecl;
  sfClock_copy: function(const clock: PsfClock): PsfClock; cdecl;
  sfClock_destroy: procedure(clock: PsfClock); cdecl;
  sfClock_getElapsedTime: function(const clock: PsfClock): sfTime; cdecl;
  sfClock_restart: function(clock: PsfClock): sfTime; cdecl;
  sfMutex_create: function(): PsfMutex; cdecl;
  sfMutex_destroy: procedure(mutex: PsfMutex); cdecl;
  sfMutex_lock: procedure(mutex: PsfMutex); cdecl;
  sfMutex_unlock: procedure(mutex: PsfMutex); cdecl;
  sfSleep: procedure(duration: sfTime); cdecl;
  fThread_create: function(function_: sfThread_create_function; userData: Pointer): PsfThread; cdecl;
  sfThread_destroy: procedure(thread: PsfThread); cdecl;
  sfThread_launch: procedure(thread: PsfThread); cdecl;
  sfThread_wait: procedure(thread: PsfThread); cdecl;
  sfThread_terminate: procedure(thread: PsfThread); cdecl;
  sfListener_setGlobalVolume: procedure(volume: Single); cdecl;
  sfListener_getGlobalVolume: function(): Single; cdecl;
  sfListener_setPosition: procedure(position: sfVector3f); cdecl;
  sfListener_getPosition: function(): sfVector3f; cdecl;
  sfListener_setDirection: procedure(direction: sfVector3f); cdecl;
  sfListener_getDirection: function(): sfVector3f; cdecl;
  sfListener_setUpVector: procedure(upVector: sfVector3f); cdecl;
  sfListener_getUpVector: function(): sfVector3f; cdecl;
  sfMusic_createFromFile: function(const filename: PUTF8Char): PsfMusic; cdecl;
  sfMusic_createFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt): PsfMusic; cdecl;
  sfMusic_createFromStream: function(stream: PsfInputStream): PsfMusic; cdecl;
  sfMusic_destroy: procedure(music: PsfMusic); cdecl;
  sfMusic_setLoop: procedure(music: PsfMusic; loop: sfBool); cdecl;
  sfMusic_getLoop: function(const music: PsfMusic): sfBool; cdecl;
  sfMusic_getDuration: function(const music: PsfMusic): sfTime; cdecl;
  sfMusic_getLoopPoints: function(const music: PsfMusic): sfTimeSpan; cdecl;
  sfMusic_setLoopPoints: procedure(music: PsfMusic; timePoints: sfTimeSpan); cdecl;
  sfMusic_play: procedure(music: PsfMusic); cdecl;
  sfMusic_pause: procedure(music: PsfMusic); cdecl;
  sfMusic_stop: procedure(music: PsfMusic); cdecl;
  sfMusic_getChannelCount: function(const music: PsfMusic): Cardinal; cdecl;
  sfMusic_getSampleRate: function(const music: PsfMusic): Cardinal; cdecl;
  sfMusic_getStatus: function(const music: PsfMusic): sfSoundStatus; cdecl;
  sfMusic_getPlayingOffset: function(const music: PsfMusic): sfTime; cdecl;
  sfMusic_setPitch: procedure(music: PsfMusic; pitch: Single); cdecl;
  sfMusic_setVolume: procedure(music: PsfMusic; volume: Single); cdecl;
  sfMusic_setPosition: procedure(music: PsfMusic; position: sfVector3f); cdecl;
  sfMusic_setRelativeToListener: procedure(music: PsfMusic; relative: sfBool); cdecl;
  sfMusic_setMinDistance: procedure(music: PsfMusic; distance: Single); cdecl;
  sfMusic_setAttenuation: procedure(music: PsfMusic; attenuation: Single); cdecl;
  sfMusic_setPlayingOffset: procedure(music: PsfMusic; timeOffset: sfTime); cdecl;
  sfMusic_getPitch: function(const music: PsfMusic): Single; cdecl;
  sfMusic_getVolume: function(const music: PsfMusic): Single; cdecl;
  sfMusic_getPosition: function(const music: PsfMusic): sfVector3f; cdecl;
  sfMusic_isRelativeToListener: function(const music: PsfMusic): sfBool; cdecl;
  sfMusic_getMinDistance: function(const music: PsfMusic): Single; cdecl;
  sfMusic_getAttenuation: function(const music: PsfMusic): Single; cdecl;
  sfSound_create: function(): PsfSound; cdecl;
  sfSound_copy: function(const sound: PsfSound): PsfSound; cdecl;
  sfSound_destroy: procedure(sound: PsfSound); cdecl;
  sfSound_play: procedure(sound: PsfSound); cdecl;
  sfSound_pause: procedure(sound: PsfSound); cdecl;
  sfSound_stop: procedure(sound: PsfSound); cdecl;
  sfSound_setBuffer: procedure(sound: PsfSound; const buffer: PsfSoundBuffer); cdecl;
  sfSound_getBuffer: function(const sound: PsfSound): PsfSoundBuffer; cdecl;
  sfSound_setLoop: procedure(sound: PsfSound; loop: sfBool); cdecl;
  sfSound_getLoop: function(const sound: PsfSound): sfBool; cdecl;
  sfSound_getStatus: function(const sound: PsfSound): sfSoundStatus; cdecl;
  sfSound_setPitch: procedure(sound: PsfSound; pitch: Single); cdecl;
  sfSound_setVolume: procedure(sound: PsfSound; volume: Single); cdecl;
  sfSound_setPosition: procedure(sound: PsfSound; position: sfVector3f); cdecl;
  sfSound_setRelativeToListener: procedure(sound: PsfSound; relative: sfBool); cdecl;
  sfSound_setMinDistance: procedure(sound: PsfSound; distance: Single); cdecl;
  sfSound_setAttenuation: procedure(sound: PsfSound; attenuation: Single); cdecl;
  sfSound_setPlayingOffset: procedure(sound: PsfSound; timeOffset: sfTime); cdecl;
  sfSound_getPitch: function(const sound: PsfSound): Single; cdecl;
  sfSound_getVolume: function(const sound: PsfSound): Single; cdecl;
  sfSound_getPosition: function(const sound: PsfSound): sfVector3f; cdecl;
  sfSound_isRelativeToListener: function(const sound: PsfSound): sfBool; cdecl;
  sfSound_getMinDistance: function(const sound: PsfSound): Single; cdecl;
  sfSound_getAttenuation: function(const sound: PsfSound): Single; cdecl;
  sfSound_getPlayingOffset: function(const sound: PsfSound): sfTime; cdecl;
  sfSoundBuffer_createFromFile: function(const filename: PUTF8Char): PsfSoundBuffer; cdecl;
  sfSoundBuffer_createFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt): PsfSoundBuffer; cdecl;
  sfSoundBuffer_createFromStream: function(stream: PsfInputStream): PsfSoundBuffer; cdecl;
  sfSoundBuffer_createFromSamples: function(const samples: PsfInt16; sampleCount: sfUint64; channelCount: Cardinal; sampleRate: Cardinal): PsfSoundBuffer; cdecl;
  sfSoundBuffer_copy: function(const soundBuffer: PsfSoundBuffer): PsfSoundBuffer; cdecl;
  sfSoundBuffer_destroy: procedure(soundBuffer: PsfSoundBuffer); cdecl;
  sfSoundBuffer_saveToFile: function(const soundBuffer: PsfSoundBuffer; const filename: PUTF8Char): sfBool; cdecl;
  sfSoundBuffer_getSamples: function(const soundBuffer: PsfSoundBuffer): PsfInt16; cdecl;
  sfSoundBuffer_getSampleCount: function(const soundBuffer: PsfSoundBuffer): sfUint64; cdecl;
  sfSoundBuffer_getSampleRate: function(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  sfSoundBuffer_getChannelCount: function(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  sfSoundBuffer_getDuration: function(const soundBuffer: PsfSoundBuffer): sfTime; cdecl;
  sfSoundBufferRecorder_create: function(): PsfSoundBufferRecorder; cdecl;
  sfSoundBufferRecorder_destroy: procedure(soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  sfSoundBufferRecorder_start: function(soundBufferRecorder: PsfSoundBufferRecorder; sampleRate: Cardinal): sfBool; cdecl;
  sfSoundBufferRecorder_stop: procedure(soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  sfSoundBufferRecorder_getSampleRate: function(const soundBufferRecorder: PsfSoundBufferRecorder): Cardinal; cdecl;
  sfSoundBufferRecorder_getBuffer: function(const soundBufferRecorder: PsfSoundBufferRecorder): PsfSoundBuffer; cdecl;
  sfSoundBufferRecorder_setDevice: function(soundBufferRecorder: PsfSoundBufferRecorder; const name: PUTF8Char): sfBool; cdecl;
  sfSoundBufferRecorder_getDevice: function(soundBufferRecorder: PsfSoundBufferRecorder): PUTF8Char; cdecl;
  sfSoundRecorder_create: function(onStart: sfSoundRecorderStartCallback; onProcess: sfSoundRecorderProcessCallback; onStop: sfSoundRecorderStopCallback; userData: Pointer): PsfSoundRecorder; cdecl;
  sfSoundRecorder_destroy: procedure(soundRecorder: PsfSoundRecorder); cdecl;
  sfSoundRecorder_start: function(soundRecorder: PsfSoundRecorder; sampleRate: Cardinal): sfBool; cdecl;
  sfSoundRecorder_stop: procedure(soundRecorder: PsfSoundRecorder); cdecl;
  sfSoundRecorder_getSampleRate: function(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  sfSoundRecorder_isAvailable: function(): sfBool; cdecl;
  sfSoundRecorder_setProcessingInterval: procedure(soundRecorder: PsfSoundRecorder; interval: sfTime); cdecl;
  sfSoundRecorder_getAvailableDevices: function(count: PNativeUInt): PPUTF8Char; cdecl;
  sfSoundRecorder_getDefaultDevice: function(): PUTF8Char; cdecl;
  sfSoundRecorder_setDevice: function(soundRecorder: PsfSoundRecorder; const name: PUTF8Char): sfBool; cdecl;
  sfSoundRecorder_getDevice: function(soundRecorder: PsfSoundRecorder): PUTF8Char; cdecl;
  sfSoundRecorder_setChannelCount: procedure(soundRecorder: PsfSoundRecorder; channelCount: Cardinal); cdecl;
  sfSoundRecorder_getChannelCount: function(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  sfSoundStream_create: function(onGetData: sfSoundStreamGetDataCallback; onSeek: sfSoundStreamSeekCallback; channelCount: Cardinal; sampleRate: Cardinal; userData: Pointer): PsfSoundStream; cdecl;
  sfSoundStream_destroy: procedure(soundStream: PsfSoundStream); cdecl;
  sfSoundStream_play: procedure(soundStream: PsfSoundStream); cdecl;
  sfSoundStream_pause: procedure(soundStream: PsfSoundStream); cdecl;
  sfSoundStream_stop: procedure(soundStream: PsfSoundStream); cdecl;
  sfSoundStream_getStatus: function(const soundStream: PsfSoundStream): sfSoundStatus; cdecl;
  sfSoundStream_getChannelCount: function(const soundStream: PsfSoundStream): Cardinal; cdecl;
  sfSoundStream_getSampleRate: function(const soundStream: PsfSoundStream): Cardinal; cdecl;
  sfSoundStream_setPitch: procedure(soundStream: PsfSoundStream; pitch: Single); cdecl;
  sfSoundStream_setVolume: procedure(soundStream: PsfSoundStream; volume: Single); cdecl;
  sfSoundStream_setPosition: procedure(soundStream: PsfSoundStream; position: sfVector3f); cdecl;
  sfSoundStream_setRelativeToListener: procedure(soundStream: PsfSoundStream; relative: sfBool); cdecl;
  sfSoundStream_setMinDistance: procedure(soundStream: PsfSoundStream; distance: Single); cdecl;
  sfSoundStream_setAttenuation: procedure(soundStream: PsfSoundStream; attenuation: Single); cdecl;
  sfSoundStream_setPlayingOffset: procedure(soundStream: PsfSoundStream; timeOffset: sfTime); cdecl;
  sfSoundStream_setLoop: procedure(soundStream: PsfSoundStream; loop: sfBool); cdecl;
  sfSoundStream_getPitch: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_getVolume: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_getPosition: function(const soundStream: PsfSoundStream): sfVector3f; cdecl;
  sfSoundStream_isRelativeToListener: function(const soundStream: PsfSoundStream): sfBool; cdecl;
  sfSoundStream_getMinDistance: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_getAttenuation: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_getLoop: function(const soundStream: PsfSoundStream): sfBool; cdecl;
  sfSoundStream_getPlayingOffset: function(const soundStream: PsfSoundStream): sfTime; cdecl;
  sfClipboard_getString: function(): PUTF8Char; cdecl;
  sfClipboard_getUnicodeString: function(): PsfUint32; cdecl;
  sfClipboard_setString: procedure(const text: PUTF8Char); cdecl;
  sfClipboard_setUnicodeString: procedure(const text: PsfUint32); cdecl;
  sfJoystick_isConnected: function(joystick: Cardinal): sfBool; cdecl;
  sfJoystick_getButtonCount: function(joystick: Cardinal): Cardinal; cdecl;
  sfJoystick_hasAxis: function(joystick: Cardinal; axis: sfJoystickAxis): sfBool; cdecl;
  sfJoystick_isButtonPressed: function(joystick: Cardinal; button: Cardinal): sfBool; cdecl;
  sfJoystick_getAxisPosition: function(joystick: Cardinal; axis: sfJoystickAxis): Single; cdecl;
  sfJoystick_getIdentification: function(joystick: Cardinal): sfJoystickIdentification; cdecl;
  sfJoystick_update: procedure(); cdecl;
  sfKeyboard_isKeyPressed: function(key: sfKeyCode): sfBool; cdecl;
  sfKeyboard_isScancodePressed: function(code: sfScancode): sfBool; cdecl;
  sfKeyboard_localize: function(code: sfScancode): sfKeyCode; cdecl;
  sfKeyboard_delocalize: function(key: sfKeyCode): sfScancode; cdecl;
  sfKeyboard_getDescription: function(code: sfScancode): PUTF8Char; cdecl;
  sfKeyboard_setVirtualKeyboardVisible: procedure(visible: sfBool); cdecl;
  sfMouse_isButtonPressed: function(button: sfMouseButton): sfBool; cdecl;
  sfMouse_getPosition: function(const relativeTo: PsfWindow): sfVector2i; cdecl;
  sfMouse_setPosition: procedure(position: sfVector2i; const relativeTo: PsfWindow); cdecl;
  sfSensor_isAvailable: function(sensor: sfSensorType): sfBool; cdecl;
  sfSensor_setEnabled: procedure(sensor: sfSensorType; enabled: sfBool); cdecl;
  sfSensor_getValue: function(sensor: sfSensorType): sfVector3f; cdecl;
  sfVideoMode_getDesktopMode: function(): sfVideoMode; cdecl;
  sfVideoMode_getFullscreenModes: function(count: PNativeUInt): PsfVideoMode; cdecl;
  sfVideoMode_isValid: function(mode: sfVideoMode): sfBool; cdecl;
  sfWindow_create: function(mode: sfVideoMode; const title: PUTF8Char; style: sfUint32; const settings: PsfContextSettings): PsfWindow; cdecl;
  sfWindow_createUnicode: function(mode: sfVideoMode; const title: PsfUint32; style: sfUint32; const settings: PsfContextSettings): PsfWindow; cdecl;
  sfWindow_createFromHandle: function(handle: sfWindowHandle; const settings: PsfContextSettings): PsfWindow; cdecl;
  sfWindow_destroy: procedure(window: PsfWindow); cdecl;
  sfWindow_close: procedure(window: PsfWindow); cdecl;
  sfWindow_isOpen: function(const window: PsfWindow): sfBool; cdecl;
  sfWindow_getSettings: function(const window: PsfWindow): sfContextSettings; cdecl;
  sfWindow_pollEvent: function(window: PsfWindow; event: PsfEvent): sfBool; cdecl;
  sfWindow_waitEvent: function(window: PsfWindow; event: PsfEvent): sfBool; cdecl;
  sfWindow_getPosition: function(const window: PsfWindow): sfVector2i; cdecl;
  sfWindow_setPosition: procedure(window: PsfWindow; position: sfVector2i); cdecl;
  sfWindow_getSize: function(const window: PsfWindow): sfVector2u; cdecl;
  sfWindow_setSize: procedure(window: PsfWindow; size: sfVector2u); cdecl;
  sfWindow_setTitle: procedure(window: PsfWindow; const title: PUTF8Char); cdecl;
  sfWindow_setUnicodeTitle: procedure(window: PsfWindow; const title: PsfUint32); cdecl;
  sfWindow_setIcon: procedure(window: PsfWindow; width: Cardinal; height: Cardinal; const pixels: PsfUint8); cdecl;
  sfWindow_setVisible: procedure(window: PsfWindow; visible: sfBool); cdecl;
  sfWindow_setVerticalSyncEnabled: procedure(window: PsfWindow; enabled: sfBool); cdecl;
  sfWindow_setMouseCursorVisible: procedure(window: PsfWindow; visible: sfBool); cdecl;
  sfWindow_setMouseCursorGrabbed: procedure(window: PsfWindow; grabbed: sfBool); cdecl;
  sfWindow_setMouseCursor: procedure(window: PsfWindow; const cursor: PsfCursor); cdecl;
  sfWindow_setKeyRepeatEnabled: procedure(window: PsfWindow; enabled: sfBool); cdecl;
  sfWindow_setFramerateLimit: procedure(window: PsfWindow; limit: Cardinal); cdecl;
  sfWindow_setJoystickThreshold: procedure(window: PsfWindow; threshold: Single); cdecl;
  sfWindow_setActive: function(window: PsfWindow; active: sfBool): sfBool; cdecl;
  sfWindow_requestFocus: procedure(window: PsfWindow); cdecl;
  sfWindow_hasFocus: function(const window: PsfWindow): sfBool; cdecl;
  sfWindow_display: procedure(window: PsfWindow); cdecl;
  sfWindow_getSystemHandle: function(const window: PsfWindow): sfWindowHandle; cdecl;
  sfContext_create: function(): PsfContext; cdecl;
  sfContext_destroy: procedure(context: PsfContext); cdecl;
  sfContext_isExtensionAvailable: function(const name: PUTF8Char): sfBool; cdecl;
  sfContext_setActive: function(context: PsfContext; active: sfBool): sfBool; cdecl;
  sfContext_getFunction: function(const name: PUTF8Char): GlFunctionPointer; cdecl;
  sfContext_getSettings: function(const context: PsfContext): sfContextSettings; cdecl;
  sfContext_getActiveContextId: function(): sfUint64; cdecl;
  sfCursor_createFromPixels: function(const pixels: PsfUint8; size: sfVector2u; hotspot: sfVector2u): PsfCursor; cdecl;
  sfCursor_createFromSystem: function(type_: sfCursorType): PsfCursor; cdecl;
  sfCursor_destroy: procedure(cursor: PsfCursor); cdecl;
  sfTouch_isDown: function(finger: Cardinal): sfBool; cdecl;
  sfTouch_getPosition: function(finger: Cardinal; const relativeTo: PsfWindow): sfVector2i; cdecl;
  sfColor_fromRGB: function(red: sfUint8; green: sfUint8; blue: sfUint8): sfColor; cdecl;
  sfColor_fromRGBA: function(red: sfUint8; green: sfUint8; blue: sfUint8; alpha: sfUint8): sfColor; cdecl;
  sfColor_fromInteger: function(color: sfUint32): sfColor; cdecl;
  sfColor_toInteger: function(color: sfColor): sfUint32; cdecl;
  sfColor_add: function(color1: sfColor; color2: sfColor): sfColor; cdecl;
  sfColor_subtract: function(color1: sfColor; color2: sfColor): sfColor; cdecl;
  sfColor_modulate: function(color1: sfColor; color2: sfColor): sfColor; cdecl;
  sfFloatRect_contains: function(const rect: PsfFloatRect; x: Single; y: Single): sfBool; cdecl;
  sfIntRect_contains: function(const rect: PsfIntRect; x: Integer; y: Integer): sfBool; cdecl;
  sfFloatRect_intersects: function(const rect1: PsfFloatRect; const rect2: PsfFloatRect; intersection: PsfFloatRect): sfBool; cdecl;
  sfIntRect_intersects: function(const rect1: PsfIntRect; const rect2: PsfIntRect; intersection: PsfIntRect): sfBool; cdecl;
  sfFloatRect_getPosition: function(const rect: PsfFloatRect): sfVector2f; cdecl;
  sfIntRect_getPosition: function(const rect: PsfIntRect): sfVector2i; cdecl;
  sfFloatRect_getSize: function(const rect: PsfFloatRect): sfVector2f; cdecl;
  sfIntRect_getSize: function(const rect: PsfIntRect): sfVector2i; cdecl;
  sfTransform_fromMatrix: function(a00: Single; a01: Single; a02: Single; a10: Single; a11: Single; a12: Single; a20: Single; a21: Single; a22: Single): sfTransform; cdecl;
  sfTransform_getMatrix: procedure(const transform: PsfTransform; matrix: PSingle); cdecl;
  sfTransform_getInverse: function(const transform: PsfTransform): sfTransform; cdecl;
  sfTransform_transformPoint: function(const transform: PsfTransform; point: sfVector2f): sfVector2f; cdecl;
  sfTransform_transformRect: function(const transform: PsfTransform; rectangle: sfFloatRect): sfFloatRect; cdecl;
  sfTransform_combine: procedure(transform: PsfTransform; const other: PsfTransform); cdecl;
  sfTransform_translate: procedure(transform: PsfTransform; x: Single; y: Single); cdecl;
  sfTransform_rotate: procedure(transform: PsfTransform; angle: Single); cdecl;
  sfTransform_rotateWithCenter: procedure(transform: PsfTransform; angle: Single; centerX: Single; centerY: Single); cdecl;
  sfTransform_scale: procedure(transform: PsfTransform; scaleX: Single; scaleY: Single); cdecl;
  sfTransform_scaleWithCenter: procedure(transform: PsfTransform; scaleX: Single; scaleY: Single; centerX: Single; centerY: Single); cdecl;
  sfTransform_equal: function(left: PsfTransform; right: PsfTransform): sfBool; cdecl;
  sfCircleShape_create: function(): PsfCircleShape; cdecl;
  sfCircleShape_copy: function(const shape: PsfCircleShape): PsfCircleShape; cdecl;
  sfCircleShape_destroy: procedure(shape: PsfCircleShape); cdecl;
  sfCircleShape_setPosition: procedure(shape: PsfCircleShape; position: sfVector2f); cdecl;
  sfCircleShape_setRotation: procedure(shape: PsfCircleShape; angle: Single); cdecl;
  sfCircleShape_setScale: procedure(shape: PsfCircleShape; scale: sfVector2f); cdecl;
  sfCircleShape_setOrigin: procedure(shape: PsfCircleShape; origin: sfVector2f); cdecl;
  sfCircleShape_getPosition: function(const shape: PsfCircleShape): sfVector2f; cdecl;
  sfCircleShape_getRotation: function(const shape: PsfCircleShape): Single; cdecl;
  sfCircleShape_getScale: function(const shape: PsfCircleShape): sfVector2f; cdecl;
  sfCircleShape_getOrigin: function(const shape: PsfCircleShape): sfVector2f; cdecl;
  sfCircleShape_move: procedure(shape: PsfCircleShape; offset: sfVector2f); cdecl;
  sfCircleShape_rotate: procedure(shape: PsfCircleShape; angle: Single); cdecl;
  sfCircleShape_scale: procedure(shape: PsfCircleShape; factors: sfVector2f); cdecl;
  sfCircleShape_getTransform: function(const shape: PsfCircleShape): sfTransform; cdecl;
  sfCircleShape_getInverseTransform: function(const shape: PsfCircleShape): sfTransform; cdecl;
  sfCircleShape_setTexture: procedure(shape: PsfCircleShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  sfCircleShape_setTextureRect: procedure(shape: PsfCircleShape; rect: sfIntRect); cdecl;
  sfCircleShape_setFillColor: procedure(shape: PsfCircleShape; color: sfColor); cdecl;
  sfCircleShape_setOutlineColor: procedure(shape: PsfCircleShape; color: sfColor); cdecl;
  sfCircleShape_setOutlineThickness: procedure(shape: PsfCircleShape; thickness: Single); cdecl;
  sfCircleShape_getTexture: function(const shape: PsfCircleShape): PsfTexture; cdecl;
  sfCircleShape_getTextureRect: function(const shape: PsfCircleShape): sfIntRect; cdecl;
  sfCircleShape_getFillColor: function(const shape: PsfCircleShape): sfColor; cdecl;
  sfCircleShape_getOutlineColor: function(const shape: PsfCircleShape): sfColor; cdecl;
  sfCircleShape_getOutlineThickness: function(const shape: PsfCircleShape): Single; cdecl;
  sfCircleShape_getPointCount: function(const shape: PsfCircleShape): NativeUInt; cdecl;
  sfCircleShape_getPoint: function(const shape: PsfCircleShape; index: NativeUInt): sfVector2f; cdecl;
  sfCircleShape_setRadius: procedure(shape: PsfCircleShape; radius: Single); cdecl;
  sfCircleShape_getRadius: function(const shape: PsfCircleShape): Single; cdecl;
  sfCircleShape_setPointCount: procedure(shape: PsfCircleShape; count: NativeUInt); cdecl;
  sfCircleShape_getLocalBounds: function(const shape: PsfCircleShape): sfFloatRect; cdecl;
  sfCircleShape_getGlobalBounds: function(const shape: PsfCircleShape): sfFloatRect; cdecl;
  sfConvexShape_create: function(): PsfConvexShape; cdecl;
  sfConvexShape_copy: function(const shape: PsfConvexShape): PsfConvexShape; cdecl;
  sfConvexShape_destroy: procedure(shape: PsfConvexShape); cdecl;
  sfConvexShape_setPosition: procedure(shape: PsfConvexShape; position: sfVector2f); cdecl;
  sfConvexShape_setRotation: procedure(shape: PsfConvexShape; angle: Single); cdecl;
  sfConvexShape_setScale: procedure(shape: PsfConvexShape; scale: sfVector2f); cdecl;
  sfConvexShape_setOrigin: procedure(shape: PsfConvexShape; origin: sfVector2f); cdecl;
  sfConvexShape_getPosition: function(const shape: PsfConvexShape): sfVector2f; cdecl;
  sfConvexShape_getRotation: function(const shape: PsfConvexShape): Single; cdecl;
  sfConvexShape_getScale: function(const shape: PsfConvexShape): sfVector2f; cdecl;
  sfConvexShape_getOrigin: function(const shape: PsfConvexShape): sfVector2f; cdecl;
  sfConvexShape_move: procedure(shape: PsfConvexShape; offset: sfVector2f); cdecl;
  sfConvexShape_rotate: procedure(shape: PsfConvexShape; angle: Single); cdecl;
  sfConvexShape_scale: procedure(shape: PsfConvexShape; factors: sfVector2f); cdecl;
  sfConvexShape_getTransform: function(const shape: PsfConvexShape): sfTransform; cdecl;
  sfConvexShape_getInverseTransform: function(const shape: PsfConvexShape): sfTransform; cdecl;
  sfConvexShape_setTexture: procedure(shape: PsfConvexShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  sfConvexShape_setTextureRect: procedure(shape: PsfConvexShape; rect: sfIntRect); cdecl;
  sfConvexShape_setFillColor: procedure(shape: PsfConvexShape; color: sfColor); cdecl;
  sfConvexShape_setOutlineColor: procedure(shape: PsfConvexShape; color: sfColor); cdecl;
  sfConvexShape_setOutlineThickness: procedure(shape: PsfConvexShape; thickness: Single); cdecl;
  sfConvexShape_getTexture: function(const shape: PsfConvexShape): PsfTexture; cdecl;
  sfConvexShape_getTextureRect: function(const shape: PsfConvexShape): sfIntRect; cdecl;
  sfConvexShape_getFillColor: function(const shape: PsfConvexShape): sfColor; cdecl;
  sfConvexShape_getOutlineColor: function(const shape: PsfConvexShape): sfColor; cdecl;
  sfConvexShape_getOutlineThickness: function(const shape: PsfConvexShape): Single; cdecl;
  sfConvexShape_getPointCount: function(const shape: PsfConvexShape): NativeUInt; cdecl;
  sfConvexShape_getPoint: function(const shape: PsfConvexShape; index: NativeUInt): sfVector2f; cdecl;
  sfConvexShape_setPointCount: procedure(shape: PsfConvexShape; count: NativeUInt); cdecl;
  sfConvexShape_setPoint: procedure(shape: PsfConvexShape; index: NativeUInt; point: sfVector2f); cdecl;
  sfConvexShape_getLocalBounds: function(const shape: PsfConvexShape): sfFloatRect; cdecl;
  sfConvexShape_getGlobalBounds: function(const shape: PsfConvexShape): sfFloatRect; cdecl;
  sfFont_createFromFile: function(const filename: PUTF8Char): PsfFont; cdecl;
  sfFont_createFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt): PsfFont; cdecl;
  sfFont_createFromStream: function(stream: PsfInputStream): PsfFont; cdecl;
  sfFont_copy: function(const font: PsfFont): PsfFont; cdecl;
  sfFont_destroy: procedure(font: PsfFont); cdecl;
  sfFont_getGlyph: function(const font: PsfFont; codePoint: sfUint32; characterSize: Cardinal; bold: sfBool; outlineThickness: Single): sfGlyph; cdecl;
  sfFont_getKerning: function(const font: PsfFont; first: sfUint32; second: sfUint32; characterSize: Cardinal): Single; cdecl;
  sfFont_getBoldKerning: function(const font: PsfFont; first: sfUint32; second: sfUint32; characterSize: Cardinal): Single; cdecl;
  sfFont_getLineSpacing: function(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  sfFont_getUnderlinePosition: function(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  sfFont_getUnderlineThickness: function(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  sfFont_getTexture: function(font: PsfFont; characterSize: Cardinal): PsfTexture; cdecl;
  sfFont_setSmooth: procedure(font: PsfFont; smooth: sfBool); cdecl;
  sfFont_isSmooth: function(const font: PsfFont): sfBool; cdecl;
  sfFont_getInfo: function(const font: PsfFont): sfFontInfo; cdecl;
  sfImage_create: function(width: Cardinal; height: Cardinal): PsfImage; cdecl;
  sfImage_createFromColor: function(width: Cardinal; height: Cardinal; color: sfColor): PsfImage; cdecl;
  sfImage_createFromPixels: function(width: Cardinal; height: Cardinal; const pixels: PsfUint8): PsfImage; cdecl;
  sfImage_createFromFile: function(const filename: PUTF8Char): PsfImage; cdecl;
  sfImage_createFromMemory: function(const data: Pointer; size: NativeUInt): PsfImage; cdecl;
  sfImage_createFromStream: function(stream: PsfInputStream): PsfImage; cdecl;
  sfImage_copy: function(const image: PsfImage): PsfImage; cdecl;
  sfImage_destroy: procedure(image: PsfImage); cdecl;
  sfImage_saveToFile: function(const image: PsfImage; const filename: PUTF8Char): sfBool; cdecl;
  sfImage_getSize: function(const image: PsfImage): sfVector2u; cdecl;
  sfImage_createMaskFromColor: procedure(image: PsfImage; color: sfColor; alpha: sfUint8); cdecl;
  sfImage_copyImage: procedure(image: PsfImage; const source: PsfImage; destX: Cardinal; destY: Cardinal; sourceRect: sfIntRect; applyAlpha: sfBool); cdecl;
  sfImage_setPixel: procedure(image: PsfImage; x: Cardinal; y: Cardinal; color: sfColor); cdecl;
  sfImage_getPixel: function(const image: PsfImage; x: Cardinal; y: Cardinal): sfColor; cdecl;
  sfImage_getPixelsPtr: function(const image: PsfImage): PsfUint8; cdecl;
  sfImage_flipHorizontally: procedure(image: PsfImage); cdecl;
  sfImage_flipVertically: procedure(image: PsfImage); cdecl;
  sfRectangleShape_create: function(): PsfRectangleShape; cdecl;
  sfRectangleShape_copy: function(const shape: PsfRectangleShape): PsfRectangleShape; cdecl;
  sfRectangleShape_destroy: procedure(shape: PsfRectangleShape); cdecl;
  sfRectangleShape_setPosition: procedure(shape: PsfRectangleShape; position: sfVector2f); cdecl;
  sfRectangleShape_setRotation: procedure(shape: PsfRectangleShape; angle: Single); cdecl;
  sfRectangleShape_setScale: procedure(shape: PsfRectangleShape; scale: sfVector2f); cdecl;
  sfRectangleShape_setOrigin: procedure(shape: PsfRectangleShape; origin: sfVector2f); cdecl;
  sfRectangleShape_getPosition: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_getRotation: function(const shape: PsfRectangleShape): Single; cdecl;
  sfRectangleShape_getScale: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_getOrigin: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_move: procedure(shape: PsfRectangleShape; offset: sfVector2f); cdecl;
  sfRectangleShape_rotate: procedure(shape: PsfRectangleShape; angle: Single); cdecl;
  sfRectangleShape_scale: procedure(shape: PsfRectangleShape; factors: sfVector2f); cdecl;
  sfRectangleShape_getTransform: function(const shape: PsfRectangleShape): sfTransform; cdecl;
  sfRectangleShape_getInverseTransform: function(const shape: PsfRectangleShape): sfTransform; cdecl;
  sfRectangleShape_setTexture: procedure(shape: PsfRectangleShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  sfRectangleShape_setTextureRect: procedure(shape: PsfRectangleShape; rect: sfIntRect); cdecl;
  sfRectangleShape_setFillColor: procedure(shape: PsfRectangleShape; color: sfColor); cdecl;
  sfRectangleShape_setOutlineColor: procedure(shape: PsfRectangleShape; color: sfColor); cdecl;
  sfRectangleShape_setOutlineThickness: procedure(shape: PsfRectangleShape; thickness: Single); cdecl;
  sfRectangleShape_getTexture: function(const shape: PsfRectangleShape): PsfTexture; cdecl;
  sfRectangleShape_getTextureRect: function(const shape: PsfRectangleShape): sfIntRect; cdecl;
  sfRectangleShape_getFillColor: function(const shape: PsfRectangleShape): sfColor; cdecl;
  sfRectangleShape_getOutlineColor: function(const shape: PsfRectangleShape): sfColor; cdecl;
  sfRectangleShape_getOutlineThickness: function(const shape: PsfRectangleShape): Single; cdecl;
  sfRectangleShape_getPointCount: function(const shape: PsfRectangleShape): NativeUInt; cdecl;
  sfRectangleShape_getPoint: function(const shape: PsfRectangleShape; index: NativeUInt): sfVector2f; cdecl;
  sfRectangleShape_setSize: procedure(shape: PsfRectangleShape; size: sfVector2f); cdecl;
  sfRectangleShape_getSize: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_getLocalBounds: function(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  sfRectangleShape_getGlobalBounds: function(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  sfRenderStates_default: function(): sfRenderStates; cdecl;
  sfRenderTexture_create: function(width: Cardinal; height: Cardinal; depthBuffer: sfBool): PsfRenderTexture; cdecl;
  sfRenderTexture_createWithSettings: function(width: Cardinal; height: Cardinal; const settings: PsfContextSettings): PsfRenderTexture; cdecl;
  sfRenderTexture_destroy: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_getSize: function(const renderTexture: PsfRenderTexture): sfVector2u; cdecl;
  sfRenderTexture_isSrgb: function(const renderTexture: PsfRenderTexture): sfBool; cdecl;
  sfRenderTexture_setActive: function(renderTexture: PsfRenderTexture; active: sfBool): sfBool; cdecl;
  sfRenderTexture_display: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_clear: procedure(renderTexture: PsfRenderTexture; color: sfColor); cdecl;
  sfRenderTexture_setView: procedure(renderTexture: PsfRenderTexture; const view: PsfView); cdecl;
  sfRenderTexture_getView: function(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  sfRenderTexture_getDefaultView: function(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  sfRenderTexture_getViewport: function(const renderTexture: PsfRenderTexture; const view: PsfView): sfIntRect; cdecl;
  sfRenderTexture_mapPixelToCoords: function(const renderTexture: PsfRenderTexture; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  sfRenderTexture_mapCoordsToPixel: function(const renderTexture: PsfRenderTexture; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  sfRenderTexture_drawSprite: procedure(renderTexture: PsfRenderTexture; const object_: PsfSprite; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawText: procedure(renderTexture: PsfRenderTexture; const object_: PsfText; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawShape: procedure(renderTexture: PsfRenderTexture; const object_: PsfShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawCircleShape: procedure(renderTexture: PsfRenderTexture; const object_: PsfCircleShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawConvexShape: procedure(renderTexture: PsfRenderTexture; const object_: PsfConvexShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawRectangleShape: procedure(renderTexture: PsfRenderTexture; const object_: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawVertexArray: procedure(renderTexture: PsfRenderTexture; const object_: PsfVertexArray; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawVertexBuffer: procedure(renderTexture: PsfRenderTexture; const object_: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawVertexBufferRange: procedure(renderTexture: PsfRenderTexture; const object_: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  sfRenderTexture_drawPrimitives: procedure(renderTexture: PsfRenderTexture; const vertices: PsfVertex; vertexCount: NativeUInt; type_: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  sfRenderTexture_pushGLStates: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_popGLStates: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_resetGLStates: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_getTexture: function(const renderTexture: PsfRenderTexture): PsfTexture; cdecl;
  sfRenderTexture_getMaximumAntialiasingLevel: function(): Cardinal; cdecl;
  sfRenderTexture_setSmooth: procedure(renderTexture: PsfRenderTexture; smooth: sfBool); cdecl;
  sfRenderTexture_isSmooth: function(const renderTexture: PsfRenderTexture): sfBool; cdecl;
  sfRenderTexture_setRepeated: procedure(renderTexture: PsfRenderTexture; repeated: sfBool); cdecl;
  sfRenderTexture_isRepeated: function(const renderTexture: PsfRenderTexture): sfBool; cdecl;
  sfRenderTexture_generateMipmap: function(renderTexture: PsfRenderTexture): sfBool; cdecl;
  sfRenderWindow_create: function(mode: sfVideoMode; const title: PUTF8Char; style: sfUint32; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  sfRenderWindow_createUnicode: function(mode: sfVideoMode; const title: PsfUint32; style: sfUint32; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  sfRenderWindow_createFromHandle: function(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  sfRenderWindow_destroy: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_close: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_isOpen: function(const renderWindow: PsfRenderWindow): sfBool; cdecl;
  sfRenderWindow_getSettings: function(const renderWindow: PsfRenderWindow): sfContextSettings; cdecl;
  sfRenderWindow_pollEvent: function(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool; cdecl;
  sfRenderWindow_waitEvent: function(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool; cdecl;
  sfRenderWindow_getPosition: function(const renderWindow: PsfRenderWindow): sfVector2i; cdecl;
  sfRenderWindow_setPosition: procedure(renderWindow: PsfRenderWindow; position: sfVector2i); cdecl;
  sfRenderWindow_getSize: function(const renderWindow: PsfRenderWindow): sfVector2u; cdecl;
  sfRenderWindow_isSrgb: function(const renderWindow: PsfRenderWindow): sfBool; cdecl;
  sfRenderWindow_setSize: procedure(renderWindow: PsfRenderWindow; size: sfVector2u); cdecl;
  sfRenderWindow_setTitle: procedure(renderWindow: PsfRenderWindow; const title: PUTF8Char); cdecl;
  sfRenderWindow_setUnicodeTitle: procedure(renderWindow: PsfRenderWindow; const title: PsfUint32); cdecl;
  sfRenderWindow_setIcon: procedure(renderWindow: PsfRenderWindow; width: Cardinal; height: Cardinal; const pixels: PsfUint8); cdecl;
  sfRenderWindow_setVisible: procedure(renderWindow: PsfRenderWindow; visible: sfBool); cdecl;
  sfRenderWindow_setVerticalSyncEnabled: procedure(renderWindow: PsfRenderWindow; enabled: sfBool); cdecl;
  sfRenderWindow_setMouseCursorVisible: procedure(renderWindow: PsfRenderWindow; show: sfBool); cdecl;
  sfRenderWindow_setMouseCursorGrabbed: procedure(renderWindow: PsfRenderWindow; grabbed: sfBool); cdecl;
  sfRenderWindow_setMouseCursor: procedure(window: PsfRenderWindow; const cursor: PsfCursor); cdecl;
  sfRenderWindow_setKeyRepeatEnabled: procedure(renderWindow: PsfRenderWindow; enabled: sfBool); cdecl;
  sfRenderWindow_setFramerateLimit: procedure(renderWindow: PsfRenderWindow; limit: Cardinal); cdecl;
  sfRenderWindow_setJoystickThreshold: procedure(renderWindow: PsfRenderWindow; threshold: Single); cdecl;
  sfRenderWindow_setActive: function(renderWindow: PsfRenderWindow; active: sfBool): sfBool; cdecl;
  sfRenderWindow_requestFocus: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_hasFocus: function(const renderWindow: PsfRenderWindow): sfBool; cdecl;
  sfRenderWindow_display: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_getSystemHandle: function(const renderWindow: PsfRenderWindow): sfWindowHandle; cdecl;
  sfRenderWindow_clear: procedure(renderWindow: PsfRenderWindow; color: sfColor); cdecl;
  sfRenderWindow_setView: procedure(renderWindow: PsfRenderWindow; const view: PsfView); cdecl;
  sfRenderWindow_getView: function(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  sfRenderWindow_getDefaultView: function(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  sfRenderWindow_getViewport: function(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect; cdecl;
  sfRenderWindow_mapPixelToCoords: function(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  sfRenderWindow_mapCoordsToPixel: function(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  sfRenderWindow_drawSprite: procedure(renderWindow: PsfRenderWindow; const object_: PsfSprite; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawText: procedure(renderWindow: PsfRenderWindow; const object_: PsfText; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawShape: procedure(renderWindow: PsfRenderWindow; const object_: PsfShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawCircleShape: procedure(renderWindow: PsfRenderWindow; const object_: PsfCircleShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawConvexShape: procedure(renderWindow: PsfRenderWindow; const object_: PsfConvexShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawRectangleShape: procedure(renderWindow: PsfRenderWindow; const object_: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawVertexArray: procedure(renderWindow: PsfRenderWindow; const object_: PsfVertexArray; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawVertexBuffer: procedure(renderWindow: PsfRenderWindow; const object_: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawVertexBufferRange: procedure(renderWindow: PsfRenderWindow; const object_: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  sfRenderWindow_drawPrimitives: procedure(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; type_: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  sfRenderWindow_pushGLStates: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_popGLStates: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_resetGLStates: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_capture: function(const renderWindow: PsfRenderWindow): PsfImage; cdecl;
  sfMouse_getPositionRenderWindow: function(const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  sfMouse_setPositionRenderWindow: procedure(position: sfVector2i; const relativeTo: PsfRenderWindow); cdecl;
  sfTouch_getPositionRenderWindow: function(finger: Cardinal; const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  sfShader_createFromFile: function(const vertexShaderFilename: PUTF8Char; const geometryShaderFilename: PUTF8Char; const fragmentShaderFilename: PUTF8Char): PsfShader; cdecl;
  sfShader_createFromMemory: function(const vertexShader: PUTF8Char; const geometryShader: PUTF8Char; const fragmentShader: PUTF8Char): PsfShader; cdecl;
  sfShader_createFromStream: function(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader; cdecl;
  sfShader_destroy: procedure(shader: PsfShader); cdecl;
  sfShader_setFloatUniform: procedure(shader: PsfShader; const name: PUTF8Char; x: Single); cdecl;
  sfShader_setVec2Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec2); cdecl;
  sfShader_setVec3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec3); cdecl;
  sfShader_setVec4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec4); cdecl;
  sfShader_setColorUniform: procedure(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  sfShader_setIntUniform: procedure(shader: PsfShader; const name: PUTF8Char; x: Integer); cdecl;
  sfShader_setIvec2Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec2); cdecl;
  sfShader_setIvec3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec3); cdecl;
  sfShader_setIvec4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec4); cdecl;
  sfShader_setIntColorUniform: procedure(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  sfShader_setBoolUniform: procedure(shader: PsfShader; const name: PUTF8Char; x: sfBool); cdecl;
  sfShader_setBvec2Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec2); cdecl;
  sfShader_setBvec3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec3); cdecl;
  sfShader_setBvec4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec4); cdecl;
  sfShader_setMat3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat3); cdecl;
  sfShader_setMat4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat4); cdecl;
  sfShader_setTextureUniform: procedure(shader: PsfShader; const name: PUTF8Char; const texture: PsfTexture); cdecl;
  sfShader_setCurrentTextureUniform: procedure(shader: PsfShader; const name: PUTF8Char); cdecl;
  sfShader_setFloatUniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const scalarArray: PSingle; length: NativeUInt); cdecl;
  sfShader_setVec2UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec2; length: NativeUInt); cdecl;
  sfShader_setVec3UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec3; length: NativeUInt); cdecl;
  sfShader_setVec4UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec4; length: NativeUInt); cdecl;
  sfShader_setMat3UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat3; length: NativeUInt); cdecl;
  sfShader_setMat4UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat4; length: NativeUInt); cdecl;
  sfShader_setFloatParameter: procedure(shader: PsfShader; const name: PUTF8Char; x: Single); cdecl;
  sfShader_setFloat2Parameter: procedure(shader: PsfShader; const name: PUTF8Char; x: Single; y: Single); cdecl;
  sfShader_setFloat3Parameter: procedure(shader: PsfShader; const name: PUTF8Char; x: Single; y: Single; z: Single); cdecl;
  sfShader_setFloat4Parameter: procedure(shader: PsfShader; const name: PUTF8Char; x: Single; y: Single; z: Single; w: Single); cdecl;
  sfShader_setVector2Parameter: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfVector2f); cdecl;
  sfShader_setVector3Parameter: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfVector3f); cdecl;
  sfShader_setColorParameter: procedure(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  sfShader_setTransformParameter: procedure(shader: PsfShader; const name: PUTF8Char; transform: sfTransform); cdecl;
  sfShader_setTextureParameter: procedure(shader: PsfShader; const name: PUTF8Char; const texture: PsfTexture); cdecl;
  sfShader_setCurrentTextureParameter: procedure(shader: PsfShader; const name: PUTF8Char); cdecl;
  sfShader_getNativeHandle: function(const shader: PsfShader): Cardinal; cdecl;
  sfShader_bind: procedure(const shader: PsfShader); cdecl;
  sfShader_isAvailable: function(): sfBool; cdecl;
  sfShader_isGeometryAvailable: function(): sfBool; cdecl;
  sfShape_create: function(getPointCount: sfShapeGetPointCountCallback; getPoint: sfShapeGetPointCallback; userData: Pointer): PsfShape; cdecl;
  sfShape_destroy: procedure(shape: PsfShape); cdecl;
  sfShape_setPosition: procedure(shape: PsfShape; position: sfVector2f); cdecl;
  sfShape_setRotation: procedure(shape: PsfShape; angle: Single); cdecl;
  sfShape_setScale: procedure(shape: PsfShape; scale: sfVector2f); cdecl;
  sfShape_setOrigin: procedure(shape: PsfShape; origin: sfVector2f); cdecl;
  sfShape_getPosition: function(const shape: PsfShape): sfVector2f; cdecl;
  sfShape_getRotation: function(const shape: PsfShape): Single; cdecl;
  sfShape_getScale: function(const shape: PsfShape): sfVector2f; cdecl;
  sfShape_getOrigin: function(const shape: PsfShape): sfVector2f; cdecl;
  sfShape_move: procedure(shape: PsfShape; offset: sfVector2f); cdecl;
  sfShape_rotate: procedure(shape: PsfShape; angle: Single); cdecl;
  sfShape_scale: procedure(shape: PsfShape; factors: sfVector2f); cdecl;
  sfShape_getTransform: function(const shape: PsfShape): sfTransform; cdecl;
  sfShape_getInverseTransform: function(const shape: PsfShape): sfTransform; cdecl;
  sfShape_setTexture: procedure(shape: PsfShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  sfShape_setTextureRect: procedure(shape: PsfShape; rect: sfIntRect); cdecl;
  sfShape_setFillColor: procedure(shape: PsfShape; color: sfColor); cdecl;
  sfShape_setOutlineColor: procedure(shape: PsfShape; color: sfColor); cdecl;
  sfShape_setOutlineThickness: procedure(shape: PsfShape; thickness: Single); cdecl;
  sfShape_getTexture: function(const shape: PsfShape): PsfTexture; cdecl;
  sfShape_getTextureRect: function(const shape: PsfShape): sfIntRect; cdecl;
  sfShape_getFillColor: function(const shape: PsfShape): sfColor; cdecl;
  sfShape_getOutlineColor: function(const shape: PsfShape): sfColor; cdecl;
  sfShape_getOutlineThickness: function(const shape: PsfShape): Single; cdecl;
  sfShape_getPointCount: function(const shape: PsfShape): NativeUInt; cdecl;
  sfShape_getPoint: function(const shape: PsfShape; index: NativeUInt): sfVector2f; cdecl;
  sfShape_getLocalBounds: function(const shape: PsfShape): sfFloatRect; cdecl;
  sfShape_getGlobalBounds: function(const shape: PsfShape): sfFloatRect; cdecl;
  sfShape_update: procedure(shape: PsfShape); cdecl;
  sfSprite_create: function(): PsfSprite; cdecl;
  sfSprite_copy: function(const sprite: PsfSprite): PsfSprite; cdecl;
  sfSprite_destroy: procedure(sprite: PsfSprite); cdecl;
  sfSprite_setPosition: procedure(sprite: PsfSprite; position: sfVector2f); cdecl;
  sfSprite_setRotation: procedure(sprite: PsfSprite; angle: Single); cdecl;
  sfSprite_setScale: procedure(sprite: PsfSprite; scale: sfVector2f); cdecl;
  sfSprite_setOrigin: procedure(sprite: PsfSprite; origin: sfVector2f); cdecl;
  sfSprite_getPosition: function(const sprite: PsfSprite): sfVector2f; cdecl;
  sfSprite_getRotation: function(const sprite: PsfSprite): Single; cdecl;
  sfSprite_getScale: function(const sprite: PsfSprite): sfVector2f; cdecl;
  sfSprite_getOrigin: function(const sprite: PsfSprite): sfVector2f; cdecl;
  sfSprite_move: procedure(sprite: PsfSprite; offset: sfVector2f); cdecl;
  sfSprite_rotate: procedure(sprite: PsfSprite; angle: Single); cdecl;
  sfSprite_scale: procedure(sprite: PsfSprite; factors: sfVector2f); cdecl;
  sfSprite_getTransform: function(const sprite: PsfSprite): sfTransform; cdecl;
  sfSprite_getInverseTransform: function(const sprite: PsfSprite): sfTransform; cdecl;
  sfSprite_setTexture: procedure(sprite: PsfSprite; const texture: PsfTexture; resetRect: sfBool); cdecl;
  sfSprite_setTextureRect: procedure(sprite: PsfSprite; rectangle: sfIntRect); cdecl;
  sfSprite_setColor: procedure(sprite: PsfSprite; color: sfColor); cdecl;
  sfSprite_getTexture: function(const sprite: PsfSprite): PsfTexture; cdecl;
  sfSprite_getTextureRect: function(const sprite: PsfSprite): sfIntRect; cdecl;
  sfSprite_getColor: function(const sprite: PsfSprite): sfColor; cdecl;
  sfSprite_getLocalBounds: function(const sprite: PsfSprite): sfFloatRect; cdecl;
  sfSprite_getGlobalBounds: function(const sprite: PsfSprite): sfFloatRect; cdecl;
  sfText_create: function(): PsfText; cdecl;
  sfText_copy: function(const text: PsfText): PsfText; cdecl;
  sfText_destroy: procedure(text: PsfText); cdecl;
  sfText_setPosition: procedure(text: PsfText; position: sfVector2f); cdecl;
  sfText_setRotation: procedure(text: PsfText; angle: Single); cdecl;
  sfText_setScale: procedure(text: PsfText; scale: sfVector2f); cdecl;
  sfText_setOrigin: procedure(text: PsfText; origin: sfVector2f); cdecl;
  sfText_getPosition: function(const text: PsfText): sfVector2f; cdecl;
  sfText_getRotation: function(const text: PsfText): Single; cdecl;
  sfText_getScale: function(const text: PsfText): sfVector2f; cdecl;
  sfText_getOrigin: function(const text: PsfText): sfVector2f; cdecl;
  sfText_move: procedure(text: PsfText; offset: sfVector2f); cdecl;
  sfText_rotate: procedure(text: PsfText; angle: Single); cdecl;
  sfText_scale: procedure(text: PsfText; factors: sfVector2f); cdecl;
  sfText_getTransform: function(const text: PsfText): sfTransform; cdecl;
  sfText_getInverseTransform: function(const text: PsfText): sfTransform; cdecl;
  sfText_setString: procedure(text: PsfText; const string_: PUTF8Char); cdecl;
  sfText_setUnicodeString: procedure(text: PsfText; const string_: PsfUint32); cdecl;
  sfText_setFont: procedure(text: PsfText; const font: PsfFont); cdecl;
  sfText_setCharacterSize: procedure(text: PsfText; size: Cardinal); cdecl;
  sfText_setLineSpacing: procedure(text: PsfText; spacingFactor: Single); cdecl;
  sfText_setLetterSpacing: procedure(text: PsfText; spacingFactor: Single); cdecl;
  sfText_setStyle: procedure(text: PsfText; style: sfUint32); cdecl;
  sfText_setColor: procedure(text: PsfText; color: sfColor); cdecl;
  sfText_setFillColor: procedure(text: PsfText; color: sfColor); cdecl;
  sfText_setOutlineColor: procedure(text: PsfText; color: sfColor); cdecl;
  sfText_setOutlineThickness: procedure(text: PsfText; thickness: Single); cdecl;
  sfText_getString: function(const text: PsfText): PUTF8Char; cdecl;
  sfText_getUnicodeString: function(const text: PsfText): PsfUint32; cdecl;
  sfText_getFont: function(const text: PsfText): PsfFont; cdecl;
  sfText_getCharacterSize: function(const text: PsfText): Cardinal; cdecl;
  sfText_getLetterSpacing: function(const text: PsfText): Single; cdecl;
  sfText_getLineSpacing: function(const text: PsfText): Single; cdecl;
  sfText_getStyle: function(const text: PsfText): sfUint32; cdecl;
  sfText_getColor: function(const text: PsfText): sfColor; cdecl;
  sfText_getFillColor: function(const text: PsfText): sfColor; cdecl;
  sfText_getOutlineColor: function(const text: PsfText): sfColor; cdecl;
  sfText_getOutlineThickness: function(const text: PsfText): Single; cdecl;
  sfText_findCharacterPos: function(const text: PsfText; index: NativeUInt): sfVector2f; cdecl;
  sfText_getLocalBounds: function(const text: PsfText): sfFloatRect; cdecl;
  sfText_getGlobalBounds: function(const text: PsfText): sfFloatRect; cdecl;
  sfTexture_create: function(width: Cardinal; height: Cardinal): PsfTexture; cdecl;
  sfTexture_createFromFile: function(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_createSrgbFromFile: function(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_createFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_createSrgbFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_createFromStream: function(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_createSrgbFromStream: function(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_createFromImage: function(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_createSrgbFromImage: function(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_copy: function(const texture: PsfTexture): PsfTexture; cdecl;
  sfTexture_destroy: procedure(texture: PsfTexture); cdecl;
  sfTexture_getSize: function(const texture: PsfTexture): sfVector2u; cdecl;
  sfTexture_copyToImage: function(const texture: PsfTexture): PsfImage; cdecl;
  sfTexture_updateFromPixels: procedure(texture: PsfTexture; const pixels: PsfUint8; width: Cardinal; height: Cardinal; x: Cardinal; y: Cardinal); cdecl;
  sfTexture_updateFromTexture: procedure(destination: PsfTexture; const source: PsfTexture; x: Cardinal; y: Cardinal); cdecl;
  sfTexture_updateFromImage: procedure(texture: PsfTexture; const image: PsfImage; x: Cardinal; y: Cardinal); cdecl;
  sfTexture_updateFromWindow: procedure(texture: PsfTexture; const window: PsfWindow; x: Cardinal; y: Cardinal); cdecl;
  sfTexture_updateFromRenderWindow: procedure(texture: PsfTexture; const renderWindow: PsfRenderWindow; x: Cardinal; y: Cardinal); cdecl;
  sfTexture_setSmooth: procedure(texture: PsfTexture; smooth: sfBool); cdecl;
  sfTexture_isSmooth: function(const texture: PsfTexture): sfBool; cdecl;
  sfTexture_isSrgb: function(const texture: PsfTexture): sfBool; cdecl;
  sfTexture_setRepeated: procedure(texture: PsfTexture; repeated: sfBool); cdecl;
  sfTexture_isRepeated: function(const texture: PsfTexture): sfBool; cdecl;
  sfTexture_generateMipmap: function(texture: PsfTexture): sfBool; cdecl;
  sfTexture_swap: procedure(left: PsfTexture; right: PsfTexture); cdecl;
  sfTexture_getNativeHandle: function(const texture: PsfTexture): Cardinal; cdecl;
  sfTexture_bind: procedure(const texture: PsfTexture; type_: sfTextureCoordinateType); cdecl;
  sfTexture_getMaximumSize: function(): Cardinal; cdecl;
  sfTransformable_create: function(): PsfTransformable; cdecl;
  sfTransformable_copy: function(const transformable: PsfTransformable): PsfTransformable; cdecl;
  sfTransformable_destroy: procedure(transformable: PsfTransformable); cdecl;
  sfTransformable_setPosition: procedure(transformable: PsfTransformable; position: sfVector2f); cdecl;
  sfTransformable_setRotation: procedure(transformable: PsfTransformable; angle: Single); cdecl;
  sfTransformable_setScale: procedure(transformable: PsfTransformable; scale: sfVector2f); cdecl;
  sfTransformable_setOrigin: procedure(transformable: PsfTransformable; origin: sfVector2f); cdecl;
  sfTransformable_getPosition: function(const transformable: PsfTransformable): sfVector2f; cdecl;
  sfTransformable_getRotation: function(const transformable: PsfTransformable): Single; cdecl;
  sfTransformable_getScale: function(const transformable: PsfTransformable): sfVector2f; cdecl;
  sfTransformable_getOrigin: function(const transformable: PsfTransformable): sfVector2f; cdecl;
  sfTransformable_move: procedure(transformable: PsfTransformable; offset: sfVector2f); cdecl;
  sfTransformable_rotate: procedure(transformable: PsfTransformable; angle: Single); cdecl;
  sfTransformable_scale: procedure(transformable: PsfTransformable; factors: sfVector2f); cdecl;
  sfTransformable_getTransform: function(const transformable: PsfTransformable): sfTransform; cdecl;
  sfTransformable_getInverseTransform: function(const transformable: PsfTransformable): sfTransform; cdecl;
  sfVertexArray_create: function(): PsfVertexArray; cdecl;
  sfVertexArray_copy: function(const vertexArray: PsfVertexArray): PsfVertexArray; cdecl;
  sfVertexArray_destroy: procedure(vertexArray: PsfVertexArray); cdecl;
  sfVertexArray_getVertexCount: function(const vertexArray: PsfVertexArray): NativeUInt; cdecl;
  sfVertexArray_getVertex: function(vertexArray: PsfVertexArray; index: NativeUInt): PsfVertex; cdecl;
  sfVertexArray_clear: procedure(vertexArray: PsfVertexArray); cdecl;
  sfVertexArray_resize: procedure(vertexArray: PsfVertexArray; vertexCount: NativeUInt); cdecl;
  sfVertexArray_append: procedure(vertexArray: PsfVertexArray; vertex: sfVertex); cdecl;
  sfVertexArray_setPrimitiveType: procedure(vertexArray: PsfVertexArray; type_: sfPrimitiveType); cdecl;
  sfVertexArray_getPrimitiveType: function(vertexArray: PsfVertexArray): sfPrimitiveType; cdecl;
  sfVertexArray_getBounds: function(vertexArray: PsfVertexArray): sfFloatRect; cdecl;
  sfVertexBuffer_create: function(vertexCount: Cardinal; type_: sfPrimitiveType; usage: sfVertexBufferUsage): PsfVertexBuffer; cdecl;
  sfVertexBuffer_copy: function(const vertexBuffer: PsfVertexBuffer): PsfVertexBuffer; cdecl;
  sfVertexBuffer_destroy: procedure(vertexBuffer: PsfVertexBuffer); cdecl;
  sfVertexBuffer_getVertexCount: function(const vertexBuffer: PsfVertexBuffer): Cardinal; cdecl;
  sfVertexBuffer_update: function(vertexBuffer: PsfVertexBuffer; const vertices: PsfVertex; vertexCount: Cardinal; offset: Cardinal): sfBool; cdecl;
  sfVertexBuffer_updateFromVertexBuffer: function(vertexBuffer: PsfVertexBuffer; const other: PsfVertexBuffer): sfBool; cdecl;
  sfVertexBuffer_swap: procedure(left: PsfVertexBuffer; right: PsfVertexBuffer); cdecl;
  sfVertexBuffer_getNativeHandle: function(vertexBuffer: PsfVertexBuffer): Cardinal; cdecl;
  sfVertexBuffer_setPrimitiveType: procedure(vertexBuffer: PsfVertexBuffer; type_: sfPrimitiveType); cdecl;
  sfVertexBuffer_getPrimitiveType: function(const vertexBuffer: PsfVertexBuffer): sfPrimitiveType; cdecl;
  sfVertexBuffer_setUsage: procedure(vertexBuffer: PsfVertexBuffer; usage: sfVertexBufferUsage); cdecl;
  sfVertexBuffer_getUsage: function(const vertexBuffer: PsfVertexBuffer): sfVertexBufferUsage; cdecl;
  sfVertexBuffer_bind: procedure(const vertexBuffer: PsfVertexBuffer); cdecl;
  sfVertexBuffer_isAvailable: function(): sfBool; cdecl;
  sfView_create: function(): PsfView; cdecl;
  sfView_createFromRect: function(rectangle: sfFloatRect): PsfView; cdecl;
  sfView_copy: function(const view: PsfView): PsfView; cdecl;
  sfView_destroy: procedure(view: PsfView); cdecl;
  sfView_setCenter: procedure(view: PsfView; center: sfVector2f); cdecl;
  sfView_setSize: procedure(view: PsfView; size: sfVector2f); cdecl;
  sfView_setRotation: procedure(view: PsfView; angle: Single); cdecl;
  sfView_setViewport: procedure(view: PsfView; viewport: sfFloatRect); cdecl;
  sfView_reset: procedure(view: PsfView; rectangle: sfFloatRect); cdecl;
  sfView_getCenter: function(const view: PsfView): sfVector2f; cdecl;
  sfView_getSize: function(const view: PsfView): sfVector2f; cdecl;
  sfView_getRotation: function(const view: PsfView): Single; cdecl;
  sfView_getViewport: function(const view: PsfView): sfFloatRect; cdecl;
  sfView_move: procedure(view: PsfView; offset: sfVector2f); cdecl;
  sfView_rotate: procedure(view: PsfView; angle: Single); cdecl;
  sfView_zoom: procedure(view: PsfView; factor: Single); cdecl;
  sfIpAddress_fromString: function(const address: PUTF8Char): sfIpAddress; cdecl;
  sfIpAddress_fromBytes: function(byte0: sfUint8; byte1: sfUint8; byte2: sfUint8; byte3: sfUint8): sfIpAddress; cdecl;
  sfIpAddress_fromInteger: function(address: sfUint32): sfIpAddress; cdecl;
  sfIpAddress_toString: procedure(address: sfIpAddress; string_: PUTF8Char); cdecl;
  sfIpAddress_toInteger: function(address: sfIpAddress): sfUint32; cdecl;
  sfIpAddress_getLocalAddress: function(): sfIpAddress; cdecl;
  sfIpAddress_getPublicAddress: function(timeout: sfTime): sfIpAddress; cdecl;
  sfFtpListingResponse_destroy: procedure(ftpListingResponse: PsfFtpListingResponse); cdecl;
  sfFtpListingResponse_isOk: function(const ftpListingResponse: PsfFtpListingResponse): sfBool; cdecl;
  sfFtpListingResponse_getStatus: function(const ftpListingResponse: PsfFtpListingResponse): sfFtpStatus; cdecl;
  sfFtpListingResponse_getMessage: function(const ftpListingResponse: PsfFtpListingResponse): PUTF8Char; cdecl;
  sfFtpListingResponse_getCount: function(const ftpListingResponse: PsfFtpListingResponse): NativeUInt; cdecl;
  sfFtpListingResponse_getName: function(const ftpListingResponse: PsfFtpListingResponse; index: NativeUInt): PUTF8Char; cdecl;
  sfFtpDirectoryResponse_destroy: procedure(ftpDirectoryResponse: PsfFtpDirectoryResponse); cdecl;
  sfFtpDirectoryResponse_isOk: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): sfBool; cdecl;
  sfFtpDirectoryResponse_getStatus: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): sfFtpStatus; cdecl;
  sfFtpDirectoryResponse_getMessage: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  sfFtpDirectoryResponse_getDirectory: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  sfFtpResponse_destroy: procedure(ftpResponse: PsfFtpResponse); cdecl;
  sfFtpResponse_isOk: function(const ftpResponse: PsfFtpResponse): sfBool; cdecl;
  sfFtpResponse_getStatus: function(const ftpResponse: PsfFtpResponse): sfFtpStatus; cdecl;
  sfFtpResponse_getMessage: function(const ftpResponse: PsfFtpResponse): PUTF8Char; cdecl;
  sfFtp_create: function(): PsfFtp; cdecl;
  sfFtp_destroy: procedure(ftp: PsfFtp); cdecl;
  sfFtp_connect: function(ftp: PsfFtp; server: sfIpAddress; port: Word; timeout: sfTime): PsfFtpResponse; cdecl;
  sfFtp_loginAnonymous: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_login: function(ftp: PsfFtp; const name: PUTF8Char; const password: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_disconnect: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_keepAlive: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_getWorkingDirectory: function(ftp: PsfFtp): PsfFtpDirectoryResponse; cdecl;
  sfFtp_getDirectoryListing: function(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpListingResponse; cdecl;
  sfFtp_changeDirectory: function(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_parentDirectory: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_createDirectory: function(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_deleteDirectory: function(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_renameFile: function(ftp: PsfFtp; const file_: PUTF8Char; const newName: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_deleteFile: function(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_download: function(ftp: PsfFtp; const remoteFile: PUTF8Char; const localPath: PUTF8Char; mode: sfFtpTransferMode): PsfFtpResponse; cdecl;
  sfFtp_upload: function(ftp: PsfFtp; const localFile: PUTF8Char; const remotePath: PUTF8Char; mode: sfFtpTransferMode; append: sfBool): PsfFtpResponse; cdecl;
  sfFtp_sendCommand: function(ftp: PsfFtp; const command: PUTF8Char; const parameter: PUTF8Char): PsfFtpResponse; cdecl;
  sfHttpRequest_create: function(): PsfHttpRequest; cdecl;
  sfHttpRequest_destroy: procedure(httpRequest: PsfHttpRequest); cdecl;
  sfHttpRequest_setField: procedure(httpRequest: PsfHttpRequest; const field: PUTF8Char; const value: PUTF8Char); cdecl;
  sfHttpRequest_setMethod: procedure(httpRequest: PsfHttpRequest; method: sfHttpMethod); cdecl;
  sfHttpRequest_setUri: procedure(httpRequest: PsfHttpRequest; const uri: PUTF8Char); cdecl;
  sfHttpRequest_setHttpVersion: procedure(httpRequest: PsfHttpRequest; major: Cardinal; minor: Cardinal); cdecl;
  sfHttpRequest_setBody: procedure(httpRequest: PsfHttpRequest; const body: PUTF8Char); cdecl;
  sfHttpResponse_destroy: procedure(httpResponse: PsfHttpResponse); cdecl;
  sfHttpResponse_getField: function(const httpResponse: PsfHttpResponse; const field: PUTF8Char): PUTF8Char; cdecl;
  sfHttpResponse_getStatus: function(const httpResponse: PsfHttpResponse): sfHttpStatus; cdecl;
  sfHttpResponse_getMajorVersion: function(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  sfHttpResponse_getMinorVersion: function(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  sfHttpResponse_getBody: function(const httpResponse: PsfHttpResponse): PUTF8Char; cdecl;
  sfHttp_create: function(): PsfHttp; cdecl;
  sfHttp_destroy: procedure(http: PsfHttp); cdecl;
  sfHttp_setHost: procedure(http: PsfHttp; const host: PUTF8Char; port: Word); cdecl;
  sfHttp_sendRequest: function(http: PsfHttp; const request: PsfHttpRequest; timeout: sfTime): PsfHttpResponse; cdecl;
  sfPacket_create: function(): PsfPacket; cdecl;
  sfPacket_copy: function(const packet: PsfPacket): PsfPacket; cdecl;
  sfPacket_destroy: procedure(packet: PsfPacket); cdecl;
  sfPacket_append: procedure(packet: PsfPacket; const data: Pointer; sizeInBytes: NativeUInt); cdecl;
  sfPacket_getReadPosition: function(const packet: PsfPacket): NativeUInt; cdecl;
  sfPacket_clear: procedure(packet: PsfPacket); cdecl;
  sfPacket_getData: function(const packet: PsfPacket): Pointer; cdecl;
  sfPacket_getDataSize: function(const packet: PsfPacket): NativeUInt; cdecl;
  sfPacket_endOfPacket: function(const packet: PsfPacket): sfBool; cdecl;
  sfPacket_canRead: function(const packet: PsfPacket): sfBool; cdecl;
  sfPacket_readBool: function(packet: PsfPacket): sfBool; cdecl;
  sfPacket_readInt8: function(packet: PsfPacket): sfInt8; cdecl;
  sfPacket_readUint8: function(packet: PsfPacket): sfUint8; cdecl;
  sfPacket_readInt16: function(packet: PsfPacket): sfInt16; cdecl;
  sfPacket_readUint16: function(packet: PsfPacket): sfUint16; cdecl;
  sfPacket_readInt32: function(packet: PsfPacket): sfInt32; cdecl;
  sfPacket_readUint32: function(packet: PsfPacket): sfUint32; cdecl;
  sfPacket_readFloat: function(packet: PsfPacket): Single; cdecl;
  sfPacket_readDouble: function(packet: PsfPacket): Double; cdecl;
  sfPacket_readString: procedure(packet: PsfPacket; string_: PUTF8Char); cdecl;
  sfPacket_readWideString: procedure(packet: PsfPacket; string_: PWideChar); cdecl;
  sfPacket_writeBool: procedure(packet: PsfPacket; p2: sfBool); cdecl;
  sfPacket_writeInt8: procedure(packet: PsfPacket; p2: sfInt8); cdecl;
  sfPacket_writeUint8: procedure(packet: PsfPacket; p2: sfUint8); cdecl;
  sfPacket_writeInt16: procedure(packet: PsfPacket; p2: sfInt16); cdecl;
  sfPacket_writeUint16: procedure(packet: PsfPacket; p2: sfUint16); cdecl;
  sfPacket_writeInt32: procedure(packet: PsfPacket; p2: sfInt32); cdecl;
  sfPacket_writeUint32: procedure(packet: PsfPacket; p2: sfUint32); cdecl;
  sfPacket_writeFloat: procedure(packet: PsfPacket; p2: Single); cdecl;
  sfPacket_writeDouble: procedure(packet: PsfPacket; p2: Double); cdecl;
  sfPacket_writeString: procedure(packet: PsfPacket; const string_: PUTF8Char); cdecl;
  sfPacket_writeWideString: procedure(packet: PsfPacket; const string_: PWideChar); cdecl;
  sfSocketSelector_create: function(): PsfSocketSelector; cdecl;
  sfSocketSelector_copy: function(const selector: PsfSocketSelector): PsfSocketSelector; cdecl;
  sfSocketSelector_destroy: procedure(selector: PsfSocketSelector); cdecl;
  sfSocketSelector_addTcpListener: procedure(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  sfSocketSelector_addTcpSocket: procedure(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  sfSocketSelector_addUdpSocket: procedure(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  sfSocketSelector_removeTcpListener: procedure(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  sfSocketSelector_removeTcpSocket: procedure(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  sfSocketSelector_removeUdpSocket: procedure(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  sfSocketSelector_clear: procedure(selector: PsfSocketSelector); cdecl;
  sfSocketSelector_wait: function(selector: PsfSocketSelector; timeout: sfTime): sfBool; cdecl;
  sfSocketSelector_isTcpListenerReady: function(const selector: PsfSocketSelector; socket: PsfTcpListener): sfBool; cdecl;
  sfSocketSelector_isTcpSocketReady: function(const selector: PsfSocketSelector; socket: PsfTcpSocket): sfBool; cdecl;
  sfSocketSelector_isUdpSocketReady: function(const selector: PsfSocketSelector; socket: PsfUdpSocket): sfBool; cdecl;
  sfTcpListener_create: function(): PsfTcpListener; cdecl;
  sfTcpListener_destroy: procedure(listener: PsfTcpListener); cdecl;
  sfTcpListener_setBlocking: procedure(listener: PsfTcpListener; blocking: sfBool); cdecl;
  sfTcpListener_isBlocking: function(const listener: PsfTcpListener): sfBool; cdecl;
  sfTcpListener_getLocalPort: function(const listener: PsfTcpListener): Word; cdecl;
  sfTcpListener_listen: function(listener: PsfTcpListener; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  sfTcpListener_accept: function(listener: PsfTcpListener; connected: PPsfTcpSocket): sfSocketStatus; cdecl;
  sfTcpSocket_create: function(): PsfTcpSocket; cdecl;
  sfTcpSocket_destroy: procedure(socket: PsfTcpSocket); cdecl;
  sfTcpSocket_setBlocking: procedure(socket: PsfTcpSocket; blocking: sfBool); cdecl;
  sfTcpSocket_isBlocking: function(const socket: PsfTcpSocket): sfBool; cdecl;
  sfTcpSocket_getLocalPort: function(const socket: PsfTcpSocket): Word; cdecl;
  sfTcpSocket_getRemoteAddress: function(const socket: PsfTcpSocket): sfIpAddress; cdecl;
  sfTcpSocket_getRemotePort: function(const socket: PsfTcpSocket): Word; cdecl;
  sfTcpSocket_connect: function(socket: PsfTcpSocket; remoteAddress: sfIpAddress; remotePort: Word; timeout: sfTime): sfSocketStatus; cdecl;
  sfTcpSocket_disconnect: procedure(socket: PsfTcpSocket); cdecl;
  sfTcpSocket_send: function(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt): sfSocketStatus; cdecl;
  sfTcpSocket_sendPartial: function(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt; sent: PNativeUInt): sfSocketStatus; cdecl;
  sfTcpSocket_receive: function(socket: PsfTcpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt): sfSocketStatus; cdecl;
  sfTcpSocket_sendPacket: function(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  sfTcpSocket_receivePacket: function(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  sfUdpSocket_create: function(): PsfUdpSocket; cdecl;
  sfUdpSocket_destroy: procedure(socket: PsfUdpSocket); cdecl;
  sfUdpSocket_setBlocking: procedure(socket: PsfUdpSocket; blocking: sfBool); cdecl;
  sfUdpSocket_isBlocking: function(const socket: PsfUdpSocket): sfBool; cdecl;
  sfUdpSocket_getLocalPort: function(const socket: PsfUdpSocket): Word; cdecl;
  sfUdpSocket_bind: function(socket: PsfUdpSocket; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  sfUdpSocket_unbind: procedure(socket: PsfUdpSocket); cdecl;
  sfUdpSocket_send: function(socket: PsfUdpSocket; const data: Pointer; size: NativeUInt; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  sfUdpSocket_receive: function(socket: PsfUdpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  sfUdpSocket_sendPacket: function(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  sfUdpSocket_receivePacket: function(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  sfUdpSocket_maxDatagramSize: function(): Cardinal; cdecl;
  {$ENDREGION}

{$REGION ' Utils '}
function  Vector2f(aX, aY: Single): sfVector2f;
procedure SetLetterBoxView(aView: PsfView; aWindowWidth, aWindowHeight: Integer);
function  CreateView(aWindowWidth, aWindowHeight: Integer): PsfView;
function  GetScreenWorkAreaSize: sfVector2i;
procedure ScaleWindowToMonitor(aWindow: PsfRenderWindow; aDefaultDPI: Integer=96);
procedure SetDefaultIcon(aWindow: PsfRenderWindow);
{$ENDREGION}

implementation

{$R PSFML.res}

{$REGION ' Utils '}
function  Vector2f(aX, aY: Single): sfVector2f;
begin
  Result.x := aX;
  Result.y := aY;
end;

procedure SetLetterBoxView(aView: PsfView; aWindowWidth, aWindowHeight: Integer);
begin
  var LWindowRatio: Single := aWindowWidth / aWindowHeight;
  var LViewRatio: Single := sfView_getSize(aView).x / sfView_getSize(aView).y;
  var LViewPort: sfFloatRect;
  var LHorizontalSpacing := True;

  LViewPort.left := 0;
  LViewPort.top := 0;
  LViewPort.width := 1;
  LViewPort.height := 1;

  if LWindowRatio < LViewRatio then
    LHorizontalSpacing := false;

  if LHorizontalSpacing then
    begin
      LViewPort.width := LViewRatio / LWindowRatio;
      LViewPort.left := (1 - LViewPort.width) / 2.0;
    end
  else
    begin
      LViewPort.height := LWindowRatio / LViewRatio;
      LViewPort.top := (1 - LViewPort.height) / 2.0;
    end;

  sfView_setViewport(aView, LViewPort);
end;

function  CreateView(aWindowWidth, aWindowHeight: Integer): PsfView;
begin
  Result := sfView_create;
  sfView_setSize(Result, Vector2f(aWindowWidth, aWindowHeight));
  sfView_setCenter(Result, Vector2f(sfView_getSize(Result).x/2, sfView_getSize(Result).y/2));
  SetLetterBoxView(Result, aWindowWidth, aWindowHeight);
end;

function  GetScreenWorkAreaSize: sfVector2i;
var
  LRect: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, LRect, 0);
  Result.X := LRect.Width;
  Result.Y := LRect.Height;
end;

procedure ScaleWindowToMonitor(aWindow: PsfRenderWindow; aDefaultDPI: Integer=96);
var
  LDpi: UINT;
  LSize: sfVector2u;
  LScaleSize: sfVector2u;
  LPos: sfVector2i;
  LScreenSize: sfVector2i;
begin
  if aWindow = nil then Exit;

  // get window DPI
  LDpi := GetDpiForWindow(HWND(sfRenderWindow_getSystemHandle(aWindow)));

  // get window size
  LSize := sfRenderWindow_getSize(aWindow);

  // get scaled widow size
  LScaleSize.x := MulDiv(LSize.x, LDPI, aDefaultDPI);
  LScaleSize.y := MulDiv(LSize.y, LDpi, aDefaultDPI);

  // get center window position
  LScreenSize := GetScreenWorkAreaSize;

  LPos.x := (Cardinal(LScreenSize.X) - LScaleSize.x) div 2;
  LPos.y := (Cardinal(LScreenSize.Y) - LScaleSize.y) div 2;

  // set new postion
  sfRenderWindow_setPosition(aWindow, LPos);

  // set new scale
  sfRenderWindow_setSize(aWindow, LScaleSize);
end;

procedure SetDefaultIcon(aWindow: PsfRenderWindow);
var
  IconHandle: HICON;
begin
  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(HWND(sfRenderWindow_getSystemHandle(aWindow)),
      WM_SETICON, ICON_BIG, IconHandle);
  end;
end;
{$ENDREGION}

{$REGION ' Exports '}
procedure GetExports(ADllHandle: THandle);
begin
  if ADllHandle = 0 then Exit;

  sfTime_asSeconds:= GetProcAddress(ADllHandle, 'sfTime_asSeconds');
  sfTime_asMilliseconds:= GetProcAddress(ADllHandle, 'sfTime_asMilliseconds');
  sfTime_asMicroseconds:= GetProcAddress(ADllHandle, 'sfTime_asMicroseconds');
  sfSeconds:= GetProcAddress(ADllHandle, 'sfSeconds');
  sfMilliseconds:= GetProcAddress(ADllHandle, 'sfMilliseconds');
  sfMicroseconds:= GetProcAddress(ADllHandle, 'sfMicroseconds');
  sfClock_create:= GetProcAddress(ADllHandle, 'sfClock_create');
  sfClock_copy:= GetProcAddress(ADllHandle, 'sfClock_copy');
  sfClock_destroy:= GetProcAddress(ADllHandle, 'sfClock_destroy');
  sfClock_getElapsedTime:= GetProcAddress(ADllHandle, 'sfClock_getElapsedTime');
  sfClock_restart:= GetProcAddress(ADllHandle, 'sfClock_restart');
  sfMutex_create:= GetProcAddress(ADllHandle, 'sfMutex_create');
  sfMutex_destroy:= GetProcAddress(ADllHandle, 'sfMutex_destroy');
  sfMutex_lock:= GetProcAddress(ADllHandle, 'sfMutex_lock');
  sfMutex_unlock:= GetProcAddress(ADllHandle, 'sfMutex_unlock');
  sfSleep:= GetProcAddress(ADllHandle, 'sfSleep');
  fThread_create:= GetProcAddress(ADllHandle, 'fThread_create');
  sfThread_destroy:= GetProcAddress(ADllHandle, 'sfThread_destroy');
  sfThread_launch:= GetProcAddress(ADllHandle, 'sfThread_launch');
  sfThread_wait:= GetProcAddress(ADllHandle, 'sfThread_wait');
  sfThread_terminate:= GetProcAddress(ADllHandle, 'sfThread_terminate');
  sfListener_setGlobalVolume:= GetProcAddress(ADllHandle, 'sfListener_setGlobalVolume');
  sfListener_getGlobalVolume:= GetProcAddress(ADllHandle, 'sfListener_getGlobalVolume');
  sfListener_setPosition:= GetProcAddress(ADllHandle, 'sfListener_setPosition');
  sfListener_getPosition:= GetProcAddress(ADllHandle, 'sfListener_getPosition');
  sfListener_setDirection:= GetProcAddress(ADllHandle, 'sfListener_setDirection');
  sfListener_getDirection:= GetProcAddress(ADllHandle, 'sfListener_getDirection');
  sfListener_setUpVector:= GetProcAddress(ADllHandle, 'sfListener_setUpVector');
  sfListener_getUpVector:= GetProcAddress(ADllHandle, 'sfListener_getUpVector');
  sfMusic_createFromFile:= GetProcAddress(ADllHandle, 'sfMusic_createFromFile');
  sfMusic_createFromMemory:= GetProcAddress(ADllHandle, 'sfMusic_createFromMemory');
  sfMusic_createFromStream:= GetProcAddress(ADllHandle, 'sfMusic_createFromStream');
  sfMusic_destroy:= GetProcAddress(ADllHandle, 'sfMusic_destroy');
  sfMusic_setLoop:= GetProcAddress(ADllHandle, 'sfMusic_setLoop');
  sfMusic_getLoop:= GetProcAddress(ADllHandle, 'sfMusic_getLoop');
  sfMusic_getDuration:= GetProcAddress(ADllHandle, 'sfMusic_getDuration');
  sfMusic_getLoopPoints:= GetProcAddress(ADllHandle, 'sfMusic_getLoopPoints');
  sfMusic_setLoopPoints:= GetProcAddress(ADllHandle, 'sfMusic_setLoopPoints');
  sfMusic_play:= GetProcAddress(ADllHandle, 'sfMusic_play');
  sfMusic_pause:= GetProcAddress(ADllHandle, 'sfMusic_pause');
  sfMusic_stop:= GetProcAddress(ADllHandle, 'sfMusic_stop');
  sfMusic_getChannelCount:= GetProcAddress(ADllHandle, 'sfMusic_getChannelCount');
  sfMusic_getSampleRate:= GetProcAddress(ADllHandle, 'sfMusic_getSampleRate');
  sfMusic_getStatus:= GetProcAddress(ADllHandle, 'sfMusic_getStatus');
  sfMusic_getPlayingOffset:= GetProcAddress(ADllHandle, 'sfMusic_getPlayingOffset');
  sfMusic_setPitch:= GetProcAddress(ADllHandle, 'sfMusic_setPitch');
  sfMusic_setVolume:= GetProcAddress(ADllHandle, 'sfMusic_setVolume');
  sfMusic_setPosition:= GetProcAddress(ADllHandle, 'sfMusic_setPosition');
  sfMusic_setRelativeToListener:= GetProcAddress(ADllHandle, 'sfMusic_setRelativeToListener');
  sfMusic_setMinDistance:= GetProcAddress(ADllHandle, 'sfMusic_setMinDistance');
  sfMusic_setAttenuation:= GetProcAddress(ADllHandle, 'sfMusic_setAttenuation');
  sfMusic_setPlayingOffset:= GetProcAddress(ADllHandle, 'sfMusic_setPlayingOffset');
  sfMusic_getPitch:= GetProcAddress(ADllHandle, 'sfMusic_getPitch');
  sfMusic_getVolume:= GetProcAddress(ADllHandle, 'sfMusic_getVolume');
  sfMusic_getPosition:= GetProcAddress(ADllHandle, 'sfMusic_getPosition');
  sfMusic_isRelativeToListener:= GetProcAddress(ADllHandle, 'sfMusic_isRelativeToListener');
  sfMusic_getMinDistance:= GetProcAddress(ADllHandle, 'sfMusic_getMinDistance');
  sfMusic_getAttenuation:= GetProcAddress(ADllHandle, 'sfMusic_getAttenuation');
  sfSound_create:= GetProcAddress(ADllHandle, 'sfSound_create');
  sfSound_copy:= GetProcAddress(ADllHandle, 'sfSound_copy');
  sfSound_destroy:= GetProcAddress(ADllHandle, 'sfSound_destroy');
  sfSound_play:= GetProcAddress(ADllHandle, 'sfSound_play');
  sfSound_pause:= GetProcAddress(ADllHandle, 'sfSound_pause');
  sfSound_stop:= GetProcAddress(ADllHandle, 'sfSound_stop');
  sfSound_setBuffer:= GetProcAddress(ADllHandle, 'sfSound_setBuffer');
  sfSound_getBuffer:= GetProcAddress(ADllHandle, 'sfSound_getBuffer');
  sfSound_setLoop:= GetProcAddress(ADllHandle, 'sfSound_setLoop');
  sfSound_getLoop:= GetProcAddress(ADllHandle, 'sfSound_getLoop');
  sfSound_getStatus:= GetProcAddress(ADllHandle, 'sfSound_getStatus');
  sfSound_setPitch:= GetProcAddress(ADllHandle, 'sfSound_setPitch');
  sfSound_setVolume:= GetProcAddress(ADllHandle, 'sfSound_setVolume');
  sfSound_setPosition:= GetProcAddress(ADllHandle, 'sfSound_setPosition');
  sfSound_setRelativeToListener:= GetProcAddress(ADllHandle, 'sfSound_setRelativeToListener');
  sfSound_setMinDistance:= GetProcAddress(ADllHandle, 'sfSound_setMinDistance');
  sfSound_setAttenuation:= GetProcAddress(ADllHandle, 'sfSound_setAttenuation');
  sfSound_setPlayingOffset:= GetProcAddress(ADllHandle, 'sfSound_setPlayingOffset');
  sfSound_getPitch:= GetProcAddress(ADllHandle, 'sfSound_getPitch');
  sfSound_getVolume:= GetProcAddress(ADllHandle, 'sfSound_getVolume');
  sfSound_getPosition:= GetProcAddress(ADllHandle, 'sfSound_getPosition');
  sfSound_isRelativeToListener:= GetProcAddress(ADllHandle, 'sfSound_isRelativeToListener');
  sfSound_getMinDistance:= GetProcAddress(ADllHandle, 'sfSound_getMinDistance');
  sfSound_getAttenuation:= GetProcAddress(ADllHandle, 'sfSound_getAttenuation');
  sfSound_getPlayingOffset:= GetProcAddress(ADllHandle, 'sfSound_getPlayingOffset');
  sfSoundBuffer_createFromFile:= GetProcAddress(ADllHandle, 'sfSoundBuffer_createFromFile');
  sfSoundBuffer_createFromMemory:= GetProcAddress(ADllHandle, 'sfSoundBuffer_createFromMemory');
  sfSoundBuffer_createFromStream:= GetProcAddress(ADllHandle, 'sfSoundBuffer_createFromStream');
  sfSoundBuffer_createFromSamples:= GetProcAddress(ADllHandle, 'sfSoundBuffer_createFromSamples');
  sfSoundBuffer_copy:= GetProcAddress(ADllHandle, 'sfSoundBuffer_copy');
  sfSoundBuffer_destroy:= GetProcAddress(ADllHandle, 'sfSoundBuffer_destroy');
  sfSoundBuffer_saveToFile:= GetProcAddress(ADllHandle, 'sfSoundBuffer_saveToFile');
  sfSoundBuffer_getSamples:= GetProcAddress(ADllHandle, 'sfSoundBuffer_getSamples');
  sfSoundBuffer_getSampleCount:= GetProcAddress(ADllHandle, 'sfSoundBuffer_getSampleCount');
  sfSoundBuffer_getSampleRate:= GetProcAddress(ADllHandle, 'sfSoundBuffer_getSampleRate');
  sfSoundBuffer_getChannelCount:= GetProcAddress(ADllHandle, 'sfSoundBuffer_getChannelCount');
  sfSoundBuffer_getDuration:= GetProcAddress(ADllHandle, 'sfSoundBuffer_getDuration');
  sfSoundBufferRecorder_create:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_create');
  sfSoundBufferRecorder_destroy:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_destroy');
  sfSoundBufferRecorder_start:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_start');
  sfSoundBufferRecorder_stop:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_stop');
  sfSoundBufferRecorder_getSampleRate:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_getSampleRate');
  sfSoundBufferRecorder_getBuffer:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_getBuffer');
  sfSoundBufferRecorder_setDevice:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_setDevice');
  sfSoundBufferRecorder_getDevice:= GetProcAddress(ADllHandle, 'sfSoundBufferRecorder_getDevice');
  sfSoundRecorder_create:= GetProcAddress(ADllHandle, 'sfSoundRecorder_create');
  sfSoundRecorder_destroy:= GetProcAddress(ADllHandle, 'sfSoundRecorder_destroy');
  sfSoundRecorder_start:= GetProcAddress(ADllHandle, 'sfSoundRecorder_start');
  sfSoundRecorder_stop:= GetProcAddress(ADllHandle, 'sfSoundRecorder_stop');
  sfSoundRecorder_getSampleRate:= GetProcAddress(ADllHandle, 'sfSoundRecorder_getSampleRate');
  sfSoundRecorder_isAvailable:= GetProcAddress(ADllHandle, 'sfSoundRecorder_isAvailable');
  sfSoundRecorder_setProcessingInterval:= GetProcAddress(ADllHandle, 'sfSoundRecorder_setProcessingInterval');
  sfSoundRecorder_getAvailableDevices:= GetProcAddress(ADllHandle, 'sfSoundRecorder_getAvailableDevices');
  sfSoundRecorder_getDefaultDevice:= GetProcAddress(ADllHandle, 'sfSoundRecorder_getDefaultDevice');
  sfSoundRecorder_setDevice:= GetProcAddress(ADllHandle, 'sfSoundRecorder_setDevice');
  sfSoundRecorder_getDevice:= GetProcAddress(ADllHandle, 'sfSoundRecorder_getDevice');
  sfSoundRecorder_setChannelCount:= GetProcAddress(ADllHandle, 'sfSoundRecorder_setChannelCount');
  sfSoundRecorder_getChannelCount:= GetProcAddress(ADllHandle, 'sfSoundRecorder_getChannelCount');
  sfSoundStream_create:= GetProcAddress(ADllHandle, 'sfSoundStream_create');
  sfSoundStream_destroy:= GetProcAddress(ADllHandle, 'sfSoundStream_destroy');
  sfSoundStream_play:= GetProcAddress(ADllHandle, 'sfSoundStream_play');
  sfSoundStream_pause:= GetProcAddress(ADllHandle, 'sfSoundStream_pause');
  sfSoundStream_stop:= GetProcAddress(ADllHandle, 'sfSoundStream_stop');
  sfSoundStream_getStatus:= GetProcAddress(ADllHandle, 'sfSoundStream_getStatus');
  sfSoundStream_getChannelCount:= GetProcAddress(ADllHandle, 'sfSoundStream_getChannelCount');
  sfSoundStream_getSampleRate:= GetProcAddress(ADllHandle, 'sfSoundStream_getSampleRate');
  sfSoundStream_setPitch:= GetProcAddress(ADllHandle, 'sfSoundStream_setPitch');
  sfSoundStream_setVolume:= GetProcAddress(ADllHandle, 'sfSoundStream_setVolume');
  sfSoundStream_setPosition:= GetProcAddress(ADllHandle, 'sfSoundStream_setPosition');
  sfSoundStream_setRelativeToListener:= GetProcAddress(ADllHandle, 'sfSoundStream_setRelativeToListener');
  sfSoundStream_setMinDistance:= GetProcAddress(ADllHandle, 'sfSoundStream_setMinDistance');
  sfSoundStream_setAttenuation:= GetProcAddress(ADllHandle, 'sfSoundStream_setAttenuation');
  sfSoundStream_setPlayingOffset:= GetProcAddress(ADllHandle, 'sfSoundStream_setPlayingOffset');
  sfSoundStream_setLoop:= GetProcAddress(ADllHandle, 'sfSoundStream_setLoop');
  sfSoundStream_getPitch:= GetProcAddress(ADllHandle, 'sfSoundStream_getPitch');
  sfSoundStream_getVolume:= GetProcAddress(ADllHandle, 'sfSoundStream_getVolume');
  sfSoundStream_getPosition:= GetProcAddress(ADllHandle, 'sfSoundStream_getPosition');
  sfSoundStream_isRelativeToListener:= GetProcAddress(ADllHandle, 'sfSoundStream_isRelativeToListener');
  sfSoundStream_getMinDistance:= GetProcAddress(ADllHandle, 'sfSoundStream_getMinDistance');
  sfSoundStream_getAttenuation:= GetProcAddress(ADllHandle, 'sfSoundStream_getAttenuation');
  sfSoundStream_getLoop:= GetProcAddress(ADllHandle, 'sfSoundStream_getLoop');
  sfSoundStream_getPlayingOffset:= GetProcAddress(ADllHandle, 'sfSoundStream_getPlayingOffset');
  sfClipboard_getString:= GetProcAddress(ADllHandle, 'sfClipboard_getString');
  sfClipboard_getUnicodeString:= GetProcAddress(ADllHandle, 'sfClipboard_getUnicodeString');
  sfClipboard_setString:= GetProcAddress(ADllHandle, 'sfClipboard_setString');
  sfClipboard_setUnicodeString:= GetProcAddress(ADllHandle, 'sfClipboard_setUnicodeString');
  sfJoystick_isConnected:= GetProcAddress(ADllHandle, 'sfJoystick_isConnected');
  sfJoystick_getButtonCount:= GetProcAddress(ADllHandle, 'sfJoystick_getButtonCount');
  sfJoystick_hasAxis:= GetProcAddress(ADllHandle, 'sfJoystick_hasAxis');
  sfJoystick_isButtonPressed:= GetProcAddress(ADllHandle, 'sfJoystick_isButtonPressed');
  sfJoystick_getAxisPosition:= GetProcAddress(ADllHandle, 'sfJoystick_getAxisPosition');
  sfJoystick_getIdentification:= GetProcAddress(ADllHandle, 'sfJoystick_getIdentification');
  sfJoystick_update:= GetProcAddress(ADllHandle, 'sfJoystick_update');
  sfKeyboard_isKeyPressed:= GetProcAddress(ADllHandle, 'sfKeyboard_isKeyPressed');
  sfKeyboard_isScancodePressed:= GetProcAddress(ADllHandle, 'sfKeyboard_isScancodePressed');
  sfKeyboard_localize:= GetProcAddress(ADllHandle, 'sfKeyboard_localize');
  sfKeyboard_delocalize:= GetProcAddress(ADllHandle, 'sfKeyboard_delocalize');
  sfKeyboard_getDescription:= GetProcAddress(ADllHandle, 'sfKeyboard_getDescription');
  sfKeyboard_setVirtualKeyboardVisible:= GetProcAddress(ADllHandle, 'sfKeyboard_setVirtualKeyboardVisible');
  sfMouse_isButtonPressed:= GetProcAddress(ADllHandle, 'sfMouse_isButtonPressed');
  sfMouse_getPosition:= GetProcAddress(ADllHandle, 'sfMouse_getPosition');
  sfMouse_setPosition:= GetProcAddress(ADllHandle, 'sfMouse_setPosition');
  sfSensor_isAvailable:= GetProcAddress(ADllHandle, 'sfSensor_isAvailable');
  sfSensor_setEnabled:= GetProcAddress(ADllHandle, 'sfSensor_setEnabled');
  sfSensor_getValue:= GetProcAddress(ADllHandle, 'sfSensor_getValue');
  sfVideoMode_getDesktopMode:= GetProcAddress(ADllHandle, 'sfVideoMode_getDesktopMode');
  sfVideoMode_getFullscreenModes:= GetProcAddress(ADllHandle, 'sfVideoMode_getFullscreenModes');
  sfVideoMode_isValid:= GetProcAddress(ADllHandle, 'sfVideoMode_isValid');
  sfWindow_create:= GetProcAddress(ADllHandle, 'sfWindow_create');
  sfWindow_createUnicode:= GetProcAddress(ADllHandle, 'sfWindow_createUnicode');
  sfWindow_createFromHandle:= GetProcAddress(ADllHandle, 'sfWindow_createFromHandle');
  sfWindow_destroy:= GetProcAddress(ADllHandle, 'sfWindow_destroy');
  sfWindow_close:= GetProcAddress(ADllHandle, 'sfWindow_close');
  sfWindow_isOpen:= GetProcAddress(ADllHandle, 'sfWindow_isOpen');
  sfWindow_getSettings:= GetProcAddress(ADllHandle, 'sfWindow_getSettings');
  sfWindow_pollEvent:= GetProcAddress(ADllHandle, 'sfWindow_pollEvent');
  sfWindow_waitEvent:= GetProcAddress(ADllHandle, 'sfWindow_waitEvent');
  sfWindow_getPosition:= GetProcAddress(ADllHandle, 'sfWindow_getPosition');
  sfWindow_setPosition:= GetProcAddress(ADllHandle, 'sfWindow_setPosition');
  sfWindow_getSize:= GetProcAddress(ADllHandle, 'sfWindow_getSize');
  sfWindow_setSize:= GetProcAddress(ADllHandle, 'sfWindow_setSize');
  sfWindow_setTitle:= GetProcAddress(ADllHandle, 'sfWindow_setTitle');
  sfWindow_setUnicodeTitle:= GetProcAddress(ADllHandle, 'sfWindow_setUnicodeTitle');
  sfWindow_setIcon:= GetProcAddress(ADllHandle, 'sfWindow_setIcon');
  sfWindow_setVisible:= GetProcAddress(ADllHandle, 'sfWindow_setVisible');
  sfWindow_setVerticalSyncEnabled:= GetProcAddress(ADllHandle, 'sfWindow_setVerticalSyncEnabled');
  sfWindow_setMouseCursorVisible:= GetProcAddress(ADllHandle, 'sfWindow_setMouseCursorVisible');
  sfWindow_setMouseCursorGrabbed:= GetProcAddress(ADllHandle, 'sfWindow_setMouseCursorGrabbed');
  sfWindow_setMouseCursor:= GetProcAddress(ADllHandle, 'sfWindow_setMouseCursor');
  sfWindow_setKeyRepeatEnabled:= GetProcAddress(ADllHandle, 'sfWindow_setKeyRepeatEnabled');
  sfWindow_setFramerateLimit:= GetProcAddress(ADllHandle, 'sfWindow_setFramerateLimit');
  sfWindow_setJoystickThreshold:= GetProcAddress(ADllHandle, 'sfWindow_setJoystickThreshold');
  sfWindow_setActive:= GetProcAddress(ADllHandle, 'sfWindow_setActive');
  sfWindow_requestFocus:= GetProcAddress(ADllHandle, 'sfWindow_requestFocus');
  sfWindow_hasFocus:= GetProcAddress(ADllHandle, 'sfWindow_hasFocus');
  sfWindow_display:= GetProcAddress(ADllHandle, 'sfWindow_display');
  sfWindow_getSystemHandle:= GetProcAddress(ADllHandle, 'sfWindow_getSystemHandle');
  sfContext_create:= GetProcAddress(ADllHandle, 'sfContext_create');
  sfContext_destroy:= GetProcAddress(ADllHandle, 'sfContext_destroy');
  sfContext_isExtensionAvailable:= GetProcAddress(ADllHandle, 'sfContext_isExtensionAvailable');
  sfContext_setActive:= GetProcAddress(ADllHandle, 'sfContext_setActive');
  sfContext_getFunction:= GetProcAddress(ADllHandle, 'sfContext_getFunction');
  sfContext_getSettings:= GetProcAddress(ADllHandle, 'sfContext_getSettings');
  sfContext_getActiveContextId:= GetProcAddress(ADllHandle, 'sfContext_getActiveContextId');
  sfCursor_createFromPixels:= GetProcAddress(ADllHandle, 'sfCursor_createFromPixels');
  sfCursor_createFromSystem:= GetProcAddress(ADllHandle, 'sfCursor_createFromSystem');
  sfCursor_destroy:= GetProcAddress(ADllHandle, 'sfCursor_destroy');
  sfTouch_isDown:= GetProcAddress(ADllHandle, 'sfTouch_isDown');
  sfTouch_getPosition:= GetProcAddress(ADllHandle, 'sfTouch_getPosition');
  sfColor_fromRGB:= GetProcAddress(ADllHandle, 'sfColor_fromRGB');
  sfColor_fromRGBA:= GetProcAddress(ADllHandle, 'sfColor_fromRGBA');
  sfColor_fromInteger:= GetProcAddress(ADllHandle, 'sfColor_fromInteger');
  sfColor_toInteger:= GetProcAddress(ADllHandle, 'sfColor_toInteger');
  sfColor_add:= GetProcAddress(ADllHandle, 'sfColor_add');
  sfColor_subtract:= GetProcAddress(ADllHandle, 'sfColor_subtract');
  sfColor_modulate:= GetProcAddress(ADllHandle, 'sfColor_modulate');
  sfFloatRect_contains:= GetProcAddress(ADllHandle, 'sfFloatRect_contains');
  sfIntRect_contains:= GetProcAddress(ADllHandle, 'sfIntRect_contains');
  sfFloatRect_intersects:= GetProcAddress(ADllHandle, 'sfFloatRect_intersects');
  sfIntRect_intersects:= GetProcAddress(ADllHandle, 'sfIntRect_intersects');
  sfFloatRect_getPosition:= GetProcAddress(ADllHandle, 'sfFloatRect_getPosition');
  sfIntRect_getPosition:= GetProcAddress(ADllHandle, 'sfIntRect_getPosition');
  sfFloatRect_getSize:= GetProcAddress(ADllHandle, 'sfFloatRect_getSize');
  sfIntRect_getSize:= GetProcAddress(ADllHandle, 'sfIntRect_getSize');
  sfTransform_fromMatrix:= GetProcAddress(ADllHandle, 'sfTransform_fromMatrix');
  sfTransform_getMatrix:= GetProcAddress(ADllHandle, 'sfTransform_getMatrix');
  sfTransform_getInverse:= GetProcAddress(ADllHandle, 'sfTransform_getInverse');
  sfTransform_transformPoint:= GetProcAddress(ADllHandle, 'sfTransform_transformPoint');
  sfTransform_transformRect:= GetProcAddress(ADllHandle, 'sfTransform_transformRect');
  sfTransform_combine:= GetProcAddress(ADllHandle, 'sfTransform_combine');
  sfTransform_translate:= GetProcAddress(ADllHandle, 'sfTransform_translate');
  sfTransform_rotate:= GetProcAddress(ADllHandle, 'sfTransform_rotate');
  sfTransform_rotateWithCenter:= GetProcAddress(ADllHandle, 'sfTransform_rotateWithCenter');
  sfTransform_scale:= GetProcAddress(ADllHandle, 'sfTransform_scale');
  sfTransform_scaleWithCenter:= GetProcAddress(ADllHandle, 'sfTransform_scaleWithCenter');
  sfTransform_equal:= GetProcAddress(ADllHandle, 'sfTransform_equal');
  sfCircleShape_create:= GetProcAddress(ADllHandle, 'sfCircleShape_create');
  sfCircleShape_copy:= GetProcAddress(ADllHandle, 'sfCircleShape_copy');
  sfCircleShape_destroy:= GetProcAddress(ADllHandle, 'sfCircleShape_destroy');
  sfCircleShape_setPosition:= GetProcAddress(ADllHandle, 'sfCircleShape_setPosition');
  sfCircleShape_setRotation:= GetProcAddress(ADllHandle, 'sfCircleShape_setRotation');
  sfCircleShape_setScale:= GetProcAddress(ADllHandle, 'sfCircleShape_setScale');
  sfCircleShape_setOrigin:= GetProcAddress(ADllHandle, 'sfCircleShape_setOrigin');
  sfCircleShape_getPosition:= GetProcAddress(ADllHandle, 'sfCircleShape_getPosition');
  sfCircleShape_getRotation:= GetProcAddress(ADllHandle, 'sfCircleShape_getRotation');
  sfCircleShape_getScale:= GetProcAddress(ADllHandle, 'sfCircleShape_getScale');
  sfCircleShape_getOrigin:= GetProcAddress(ADllHandle, 'sfCircleShape_getOrigin');
  sfCircleShape_move:= GetProcAddress(ADllHandle, 'sfCircleShape_move');
  sfCircleShape_rotate:= GetProcAddress(ADllHandle, 'sfCircleShape_rotate');
  sfCircleShape_scale:= GetProcAddress(ADllHandle, 'sfCircleShape_scale');
  sfCircleShape_getTransform:= GetProcAddress(ADllHandle, 'sfCircleShape_getTransform');
  sfCircleShape_getInverseTransform:= GetProcAddress(ADllHandle, 'sfCircleShape_getInverseTransform');
  sfCircleShape_setTexture:= GetProcAddress(ADllHandle, 'sfCircleShape_setTexture');
  sfCircleShape_setTextureRect:= GetProcAddress(ADllHandle, 'sfCircleShape_setTextureRect');
  sfCircleShape_setFillColor:= GetProcAddress(ADllHandle, 'sfCircleShape_setFillColor');
  sfCircleShape_setOutlineColor:= GetProcAddress(ADllHandle, 'sfCircleShape_setOutlineColor');
  sfCircleShape_setOutlineThickness:= GetProcAddress(ADllHandle, 'sfCircleShape_setOutlineThickness');
  sfCircleShape_getTexture:= GetProcAddress(ADllHandle, 'sfCircleShape_getTexture');
  sfCircleShape_getTextureRect:= GetProcAddress(ADllHandle, 'sfCircleShape_getTextureRect');
  sfCircleShape_getFillColor:= GetProcAddress(ADllHandle, 'sfCircleShape_getFillColor');
  sfCircleShape_getOutlineColor:= GetProcAddress(ADllHandle, 'sfCircleShape_getOutlineColor');
  sfCircleShape_getOutlineThickness:= GetProcAddress(ADllHandle, 'sfCircleShape_getOutlineThickness');
  sfCircleShape_getPointCount:= GetProcAddress(ADllHandle, 'sfCircleShape_getPointCount');
  sfCircleShape_getPoint:= GetProcAddress(ADllHandle, 'sfCircleShape_getPoint');
  sfCircleShape_setRadius:= GetProcAddress(ADllHandle, 'sfCircleShape_setRadius');
  sfCircleShape_getRadius:= GetProcAddress(ADllHandle, 'sfCircleShape_getRadius');
  sfCircleShape_setPointCount:= GetProcAddress(ADllHandle, 'sfCircleShape_setPointCount');
  sfCircleShape_getLocalBounds:= GetProcAddress(ADllHandle, 'sfCircleShape_getLocalBounds');
  sfCircleShape_getGlobalBounds:= GetProcAddress(ADllHandle, 'sfCircleShape_getGlobalBounds');
  sfConvexShape_create:= GetProcAddress(ADllHandle, 'sfConvexShape_create');
  sfConvexShape_copy:= GetProcAddress(ADllHandle, 'sfConvexShape_copy');
  sfConvexShape_destroy:= GetProcAddress(ADllHandle, 'sfConvexShape_destroy');
  sfConvexShape_setPosition:= GetProcAddress(ADllHandle, 'sfConvexShape_setPosition');
  sfConvexShape_setRotation:= GetProcAddress(ADllHandle, 'sfConvexShape_setRotation');
  sfConvexShape_setScale:= GetProcAddress(ADllHandle, 'sfConvexShape_setScale');
  sfConvexShape_setOrigin:= GetProcAddress(ADllHandle, 'sfConvexShape_setOrigin');
  sfConvexShape_getPosition:= GetProcAddress(ADllHandle, 'sfConvexShape_getPosition');
  sfConvexShape_getRotation:= GetProcAddress(ADllHandle, 'sfConvexShape_getRotation');
  sfConvexShape_getScale:= GetProcAddress(ADllHandle, 'sfConvexShape_getScale');
  sfConvexShape_getOrigin:= GetProcAddress(ADllHandle, 'sfConvexShape_getOrigin');
  sfConvexShape_move:= GetProcAddress(ADllHandle, 'sfConvexShape_move');
  sfConvexShape_rotate:= GetProcAddress(ADllHandle, 'sfConvexShape_rotate');
  sfConvexShape_scale:= GetProcAddress(ADllHandle, 'sfConvexShape_scale');
  sfConvexShape_getTransform:= GetProcAddress(ADllHandle, 'sfConvexShape_getTransform');
  sfConvexShape_getInverseTransform:= GetProcAddress(ADllHandle, 'sfConvexShape_getInverseTransform');
  sfConvexShape_setTexture:= GetProcAddress(ADllHandle, 'sfConvexShape_setTexture');
  sfConvexShape_setTextureRect:= GetProcAddress(ADllHandle, 'sfConvexShape_setTextureRect');
  sfConvexShape_setFillColor:= GetProcAddress(ADllHandle, 'sfConvexShape_setFillColor');
  sfConvexShape_setOutlineColor:= GetProcAddress(ADllHandle, 'sfConvexShape_setOutlineColor');
  sfConvexShape_setOutlineThickness:= GetProcAddress(ADllHandle, 'sfConvexShape_setOutlineThickness');
  sfConvexShape_getTexture:= GetProcAddress(ADllHandle, 'sfConvexShape_getTexture');
  sfConvexShape_getTextureRect:= GetProcAddress(ADllHandle, 'sfConvexShape_getTextureRect');
  sfConvexShape_getFillColor:= GetProcAddress(ADllHandle, 'sfConvexShape_getFillColor');
  sfConvexShape_getOutlineColor:= GetProcAddress(ADllHandle, 'sfConvexShape_getOutlineColor');
  sfConvexShape_getOutlineThickness:= GetProcAddress(ADllHandle, 'sfConvexShape_getOutlineThickness');
  sfConvexShape_getPointCount:= GetProcAddress(ADllHandle, 'sfConvexShape_getPointCount');
  sfConvexShape_getPoint:= GetProcAddress(ADllHandle, 'sfConvexShape_getPoint');
  sfConvexShape_setPointCount:= GetProcAddress(ADllHandle, 'sfConvexShape_setPointCount');
  sfConvexShape_setPoint:= GetProcAddress(ADllHandle, 'sfConvexShape_setPoint');
  sfConvexShape_getLocalBounds:= GetProcAddress(ADllHandle, 'sfConvexShape_getLocalBounds');
  sfConvexShape_getGlobalBounds:= GetProcAddress(ADllHandle, 'sfConvexShape_getGlobalBounds');
  sfFont_createFromFile:= GetProcAddress(ADllHandle, 'sfFont_createFromFile');
  sfFont_createFromMemory:= GetProcAddress(ADllHandle, 'sfFont_createFromMemory');
  sfFont_createFromStream:= GetProcAddress(ADllHandle, 'sfFont_createFromStream');
  sfFont_copy:= GetProcAddress(ADllHandle, 'sfFont_copy');
  sfFont_destroy:= GetProcAddress(ADllHandle, 'sfFont_destroy');
  sfFont_getGlyph:= GetProcAddress(ADllHandle, 'sfFont_getGlyph');
  sfFont_getKerning:= GetProcAddress(ADllHandle, 'sfFont_getKerning');
  sfFont_getBoldKerning:= GetProcAddress(ADllHandle, 'sfFont_getBoldKerning');
  sfFont_getLineSpacing:= GetProcAddress(ADllHandle, 'sfFont_getLineSpacing');
  sfFont_getUnderlinePosition:= GetProcAddress(ADllHandle, 'sfFont_getUnderlinePosition');
  sfFont_getUnderlineThickness:= GetProcAddress(ADllHandle, 'sfFont_getUnderlineThickness');
  sfFont_getTexture:= GetProcAddress(ADllHandle, 'sfFont_getTexture');
  sfFont_setSmooth:= GetProcAddress(ADllHandle, 'sfFont_setSmooth');
  sfFont_isSmooth:= GetProcAddress(ADllHandle, 'sfFont_isSmooth');
  sfFont_getInfo:= GetProcAddress(ADllHandle, 'sfFont_getInfo');
  sfImage_create:= GetProcAddress(ADllHandle, 'sfImage_create');
  sfImage_createFromColor:= GetProcAddress(ADllHandle, 'sfImage_createFromColor');
  sfImage_createFromPixels:= GetProcAddress(ADllHandle, 'sfImage_createFromPixels');
  sfImage_createFromFile:= GetProcAddress(ADllHandle, 'sfImage_createFromFile');
  sfImage_createFromMemory:= GetProcAddress(ADllHandle, 'sfImage_createFromMemory');
  sfImage_createFromStream:= GetProcAddress(ADllHandle, 'sfImage_createFromStream');
  sfImage_copy:= GetProcAddress(ADllHandle, 'sfImage_copy');
  sfImage_destroy:= GetProcAddress(ADllHandle, 'sfImage_destroy');
  sfImage_saveToFile:= GetProcAddress(ADllHandle, 'sfImage_saveToFile');
  sfImage_getSize:= GetProcAddress(ADllHandle, 'sfImage_getSize');
  sfImage_createMaskFromColor:= GetProcAddress(ADllHandle, 'sfImage_createMaskFromColor');
  sfImage_copyImage:= GetProcAddress(ADllHandle, 'sfImage_copyImage');
  sfImage_setPixel:= GetProcAddress(ADllHandle, 'sfImage_setPixel');
  sfImage_getPixel:= GetProcAddress(ADllHandle, 'sfImage_getPixel');
  sfImage_getPixelsPtr:= GetProcAddress(ADllHandle, 'sfImage_getPixelsPtr');
  sfImage_flipHorizontally:= GetProcAddress(ADllHandle, 'sfImage_flipHorizontally');
  sfImage_flipVertically:= GetProcAddress(ADllHandle, 'sfImage_flipVertically');
  sfRectangleShape_create:= GetProcAddress(ADllHandle, 'sfRectangleShape_create');
  sfRectangleShape_copy:= GetProcAddress(ADllHandle, 'sfRectangleShape_copy');
  sfRectangleShape_destroy:= GetProcAddress(ADllHandle, 'sfRectangleShape_destroy');
  sfRectangleShape_setPosition:= GetProcAddress(ADllHandle, 'sfRectangleShape_setPosition');
  sfRectangleShape_setRotation:= GetProcAddress(ADllHandle, 'sfRectangleShape_setRotation');
  sfRectangleShape_setScale:= GetProcAddress(ADllHandle, 'sfRectangleShape_setScale');
  sfRectangleShape_setOrigin:= GetProcAddress(ADllHandle, 'sfRectangleShape_setOrigin');
  sfRectangleShape_getPosition:= GetProcAddress(ADllHandle, 'sfRectangleShape_getPosition');
  sfRectangleShape_getRotation:= GetProcAddress(ADllHandle, 'sfRectangleShape_getRotation');
  sfRectangleShape_getScale:= GetProcAddress(ADllHandle, 'sfRectangleShape_getScale');
  sfRectangleShape_getOrigin:= GetProcAddress(ADllHandle, 'sfRectangleShape_getOrigin');
  sfRectangleShape_move:= GetProcAddress(ADllHandle, 'sfRectangleShape_move');
  sfRectangleShape_rotate:= GetProcAddress(ADllHandle, 'sfRectangleShape_rotate');
  sfRectangleShape_scale:= GetProcAddress(ADllHandle, 'sfRectangleShape_scale');
  sfRectangleShape_getTransform:= GetProcAddress(ADllHandle, 'sfRectangleShape_getTransform');
  sfRectangleShape_getInverseTransform:= GetProcAddress(ADllHandle, 'sfRectangleShape_getInverseTransform');
  sfRectangleShape_setTexture:= GetProcAddress(ADllHandle, 'sfRectangleShape_setTexture');
  sfRectangleShape_setTextureRect:= GetProcAddress(ADllHandle, 'sfRectangleShape_setTextureRect');
  sfRectangleShape_setFillColor:= GetProcAddress(ADllHandle, 'sfRectangleShape_setFillColor');
  sfRectangleShape_setOutlineColor:= GetProcAddress(ADllHandle, 'sfRectangleShape_setOutlineColor');
  sfRectangleShape_setOutlineThickness:= GetProcAddress(ADllHandle, 'sfRectangleShape_setOutlineThickness');
  sfRectangleShape_getTexture:= GetProcAddress(ADllHandle, 'sfRectangleShape_getTexture');
  sfRectangleShape_getTextureRect:= GetProcAddress(ADllHandle, 'sfRectangleShape_getTextureRect');
  sfRectangleShape_getFillColor:= GetProcAddress(ADllHandle, 'sfRectangleShape_getFillColor');
  sfRectangleShape_getOutlineColor:= GetProcAddress(ADllHandle, 'sfRectangleShape_getOutlineColor');
  sfRectangleShape_getOutlineThickness:= GetProcAddress(ADllHandle, 'sfRectangleShape_getOutlineThickness');
  sfRectangleShape_getPointCount:= GetProcAddress(ADllHandle, 'sfRectangleShape_getPointCount');
  sfRectangleShape_getPoint:= GetProcAddress(ADllHandle, 'sfRectangleShape_getPoint');
  sfRectangleShape_setSize:= GetProcAddress(ADllHandle, 'sfRectangleShape_setSize');
  sfRectangleShape_getSize:= GetProcAddress(ADllHandle, 'sfRectangleShape_getSize');
  sfRectangleShape_getLocalBounds:= GetProcAddress(ADllHandle, 'sfRectangleShape_getLocalBounds');
  sfRectangleShape_getGlobalBounds:= GetProcAddress(ADllHandle, 'sfRectangleShape_getGlobalBounds');
  sfRenderStates_default:= GetProcAddress(ADllHandle, 'sfRenderStates_default');
  sfRenderTexture_create:= GetProcAddress(ADllHandle, 'sfRenderTexture_create');
  sfRenderTexture_createWithSettings:= GetProcAddress(ADllHandle, 'sfRenderTexture_createWithSettings');
  sfRenderTexture_destroy:= GetProcAddress(ADllHandle, 'sfRenderTexture_destroy');
  sfRenderTexture_getSize:= GetProcAddress(ADllHandle, 'sfRenderTexture_getSize');
  sfRenderTexture_isSrgb:= GetProcAddress(ADllHandle, 'sfRenderTexture_isSrgb');
  sfRenderTexture_setActive:= GetProcAddress(ADllHandle, 'sfRenderTexture_setActive');
  sfRenderTexture_display:= GetProcAddress(ADllHandle, 'sfRenderTexture_display');
  sfRenderTexture_clear:= GetProcAddress(ADllHandle, 'sfRenderTexture_clear');
  sfRenderTexture_setView:= GetProcAddress(ADllHandle, 'sfRenderTexture_setView');
  sfRenderTexture_getView:= GetProcAddress(ADllHandle, 'sfRenderTexture_getView');
  sfRenderTexture_getDefaultView:= GetProcAddress(ADllHandle, 'sfRenderTexture_getDefaultView');
  sfRenderTexture_getViewport:= GetProcAddress(ADllHandle, 'sfRenderTexture_getViewport');
  sfRenderTexture_mapPixelToCoords:= GetProcAddress(ADllHandle, 'sfRenderTexture_mapPixelToCoords');
  sfRenderTexture_mapCoordsToPixel:= GetProcAddress(ADllHandle, 'sfRenderTexture_mapCoordsToPixel');
  sfRenderTexture_drawSprite:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawSprite');
  sfRenderTexture_drawText:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawText');
  sfRenderTexture_drawShape:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawShape');
  sfRenderTexture_drawCircleShape:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawCircleShape');
  sfRenderTexture_drawConvexShape:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawConvexShape');
  sfRenderTexture_drawRectangleShape:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawRectangleShape');
  sfRenderTexture_drawVertexArray:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawVertexArray');
  sfRenderTexture_drawVertexBuffer:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawVertexBuffer');
  sfRenderTexture_drawVertexBufferRange:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawVertexBufferRange');
  sfRenderTexture_drawPrimitives:= GetProcAddress(ADllHandle, 'sfRenderTexture_drawPrimitives');
  sfRenderTexture_pushGLStates:= GetProcAddress(ADllHandle, 'sfRenderTexture_pushGLStates');
  sfRenderTexture_popGLStates:= GetProcAddress(ADllHandle, 'sfRenderTexture_popGLStates');
  sfRenderTexture_resetGLStates:= GetProcAddress(ADllHandle, 'sfRenderTexture_resetGLStates');
  sfRenderTexture_getTexture:= GetProcAddress(ADllHandle, 'sfRenderTexture_getTexture');
  sfRenderTexture_getMaximumAntialiasingLevel:= GetProcAddress(ADllHandle, 'sfRenderTexture_getMaximumAntialiasingLevel');
  sfRenderTexture_setSmooth:= GetProcAddress(ADllHandle, 'sfRenderTexture_setSmooth');
  sfRenderTexture_isSmooth:= GetProcAddress(ADllHandle, 'sfRenderTexture_isSmooth');
  sfRenderTexture_setRepeated:= GetProcAddress(ADllHandle, 'sfRenderTexture_setRepeated');
  sfRenderTexture_isRepeated:= GetProcAddress(ADllHandle, 'sfRenderTexture_isRepeated');
  sfRenderTexture_generateMipmap:= GetProcAddress(ADllHandle, 'sfRenderTexture_generateMipmap');
  sfRenderWindow_create:= GetProcAddress(ADllHandle, 'sfRenderWindow_create');
  sfRenderWindow_createUnicode:= GetProcAddress(ADllHandle, 'sfRenderWindow_createUnicode');
  sfRenderWindow_createFromHandle:= GetProcAddress(ADllHandle, 'sfRenderWindow_createFromHandle');
  sfRenderWindow_destroy:= GetProcAddress(ADllHandle, 'sfRenderWindow_destroy');
  sfRenderWindow_close:= GetProcAddress(ADllHandle, 'sfRenderWindow_close');
  sfRenderWindow_isOpen:= GetProcAddress(ADllHandle, 'sfRenderWindow_isOpen');
  sfRenderWindow_getSettings:= GetProcAddress(ADllHandle, 'sfRenderWindow_getSettings');
  sfRenderWindow_pollEvent:= GetProcAddress(ADllHandle, 'sfRenderWindow_pollEvent');
  sfRenderWindow_waitEvent:= GetProcAddress(ADllHandle, 'sfRenderWindow_waitEvent');
  sfRenderWindow_getPosition:= GetProcAddress(ADllHandle, 'sfRenderWindow_getPosition');
  sfRenderWindow_setPosition:= GetProcAddress(ADllHandle, 'sfRenderWindow_setPosition');
  sfRenderWindow_getSize:= GetProcAddress(ADllHandle, 'sfRenderWindow_getSize');
  sfRenderWindow_isSrgb:= GetProcAddress(ADllHandle, 'sfRenderWindow_isSrgb');
  sfRenderWindow_setSize:= GetProcAddress(ADllHandle, 'sfRenderWindow_setSize');
  sfRenderWindow_setTitle:= GetProcAddress(ADllHandle, 'sfRenderWindow_setTitle');
  sfRenderWindow_setUnicodeTitle:= GetProcAddress(ADllHandle, 'sfRenderWindow_setUnicodeTitle');
  sfRenderWindow_setIcon:= GetProcAddress(ADllHandle, 'sfRenderWindow_setIcon');
  sfRenderWindow_setVisible:= GetProcAddress(ADllHandle, 'sfRenderWindow_setVisible');
  sfRenderWindow_setVerticalSyncEnabled:= GetProcAddress(ADllHandle, 'sfRenderWindow_setVerticalSyncEnabled');
  sfRenderWindow_setMouseCursorVisible:= GetProcAddress(ADllHandle, 'sfRenderWindow_setMouseCursorVisible');
  sfRenderWindow_setMouseCursorGrabbed:= GetProcAddress(ADllHandle, 'sfRenderWindow_setMouseCursorGrabbed');
  sfRenderWindow_setMouseCursor:= GetProcAddress(ADllHandle, 'sfRenderWindow_setMouseCursor');
  sfRenderWindow_setKeyRepeatEnabled:= GetProcAddress(ADllHandle, 'sfRenderWindow_setKeyRepeatEnabled');
  sfRenderWindow_setFramerateLimit:= GetProcAddress(ADllHandle, 'sfRenderWindow_setFramerateLimit');
  sfRenderWindow_setJoystickThreshold:= GetProcAddress(ADllHandle, 'sfRenderWindow_setJoystickThreshold');
  sfRenderWindow_setActive:= GetProcAddress(ADllHandle, 'sfRenderWindow_setActive');
  sfRenderWindow_requestFocus:= GetProcAddress(ADllHandle, 'sfRenderWindow_requestFocus');
  sfRenderWindow_hasFocus:= GetProcAddress(ADllHandle, 'sfRenderWindow_hasFocus');
  sfRenderWindow_display:= GetProcAddress(ADllHandle, 'sfRenderWindow_display');
  sfRenderWindow_getSystemHandle:= GetProcAddress(ADllHandle, 'sfRenderWindow_getSystemHandle');
  sfRenderWindow_clear:= GetProcAddress(ADllHandle, 'sfRenderWindow_clear');
  sfRenderWindow_setView:= GetProcAddress(ADllHandle, 'sfRenderWindow_setView');
  sfRenderWindow_getView:= GetProcAddress(ADllHandle, 'sfRenderWindow_getView');
  sfRenderWindow_getDefaultView:= GetProcAddress(ADllHandle, 'sfRenderWindow_getDefaultView');
  sfRenderWindow_getViewport:= GetProcAddress(ADllHandle, 'sfRenderWindow_getViewport');
  sfRenderWindow_mapPixelToCoords:= GetProcAddress(ADllHandle, 'sfRenderWindow_mapPixelToCoords');
  sfRenderWindow_mapCoordsToPixel:= GetProcAddress(ADllHandle, 'sfRenderWindow_mapCoordsToPixel');
  sfRenderWindow_drawSprite:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawSprite');
  sfRenderWindow_drawText:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawText');
  sfRenderWindow_drawShape:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawShape');
  sfRenderWindow_drawCircleShape:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawCircleShape');
  sfRenderWindow_drawConvexShape:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawConvexShape');
  sfRenderWindow_drawRectangleShape:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawRectangleShape');
  sfRenderWindow_drawVertexArray:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawVertexArray');
  sfRenderWindow_drawVertexBuffer:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawVertexBuffer');
  sfRenderWindow_drawVertexBufferRange:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawVertexBufferRange');
  sfRenderWindow_drawPrimitives:= GetProcAddress(ADllHandle, 'sfRenderWindow_drawPrimitives');
  sfRenderWindow_pushGLStates:= GetProcAddress(ADllHandle, 'sfRenderWindow_pushGLStates');
  sfRenderWindow_popGLStates:= GetProcAddress(ADllHandle, 'sfRenderWindow_popGLStates');
  sfRenderWindow_resetGLStates:= GetProcAddress(ADllHandle, 'sfRenderWindow_resetGLStates');
  sfRenderWindow_capture:= GetProcAddress(ADllHandle, 'sfRenderWindow_capture');
  sfMouse_getPositionRenderWindow:= GetProcAddress(ADllHandle, 'sfMouse_getPositionRenderWindow');
  sfMouse_setPositionRenderWindow:= GetProcAddress(ADllHandle, 'sfMouse_setPositionRenderWindow');
  sfTouch_getPositionRenderWindow:= GetProcAddress(ADllHandle, 'sfTouch_getPositionRenderWindow');
  sfShader_createFromFile:= GetProcAddress(ADllHandle, 'sfShader_createFromFile');
  sfShader_createFromMemory:= GetProcAddress(ADllHandle, 'sfShader_createFromMemory');
  sfShader_createFromStream:= GetProcAddress(ADllHandle, 'sfShader_createFromStream');
  sfShader_destroy:= GetProcAddress(ADllHandle, 'sfShader_destroy');
  sfShader_setFloatUniform:= GetProcAddress(ADllHandle, 'sfShader_setFloatUniform');
  sfShader_setVec2Uniform:= GetProcAddress(ADllHandle, 'sfShader_setVec2Uniform');
  sfShader_setVec3Uniform:= GetProcAddress(ADllHandle, 'sfShader_setVec3Uniform');
  sfShader_setVec4Uniform:= GetProcAddress(ADllHandle, 'sfShader_setVec4Uniform');
  sfShader_setColorUniform:= GetProcAddress(ADllHandle, 'sfShader_setColorUniform');
  sfShader_setIntUniform:= GetProcAddress(ADllHandle, 'sfShader_setIntUniform');
  sfShader_setIvec2Uniform:= GetProcAddress(ADllHandle, 'sfShader_setIvec2Uniform');
  sfShader_setIvec3Uniform:= GetProcAddress(ADllHandle, 'sfShader_setIvec3Uniform');
  sfShader_setIvec4Uniform:= GetProcAddress(ADllHandle, 'sfShader_setIvec4Uniform');
  sfShader_setIntColorUniform:= GetProcAddress(ADllHandle, 'sfShader_setIntColorUniform');
  sfShader_setBoolUniform:= GetProcAddress(ADllHandle, 'sfShader_setBoolUniform');
  sfShader_setBvec2Uniform:= GetProcAddress(ADllHandle, 'sfShader_setBvec2Uniform');
  sfShader_setBvec3Uniform:= GetProcAddress(ADllHandle, 'sfShader_setBvec3Uniform');
  sfShader_setBvec4Uniform:= GetProcAddress(ADllHandle, 'sfShader_setBvec4Uniform');
  sfShader_setMat3Uniform:= GetProcAddress(ADllHandle, 'sfShader_setMat3Uniform');
  sfShader_setMat4Uniform:= GetProcAddress(ADllHandle, 'sfShader_setMat4Uniform');
  sfShader_setTextureUniform:= GetProcAddress(ADllHandle, 'sfShader_setTextureUniform');
  sfShader_setCurrentTextureUniform:= GetProcAddress(ADllHandle, 'sfShader_setCurrentTextureUniform');
  sfShader_setFloatUniformArray:= GetProcAddress(ADllHandle, 'sfShader_setFloatUniformArray');
  sfShader_setVec2UniformArray:= GetProcAddress(ADllHandle, 'sfShader_setVec2UniformArray');
  sfShader_setVec3UniformArray:= GetProcAddress(ADllHandle, 'sfShader_setVec3UniformArray');
  sfShader_setVec4UniformArray:= GetProcAddress(ADllHandle, 'sfShader_setVec4UniformArray');
  sfShader_setMat3UniformArray:= GetProcAddress(ADllHandle, 'sfShader_setMat3UniformArray');
  sfShader_setMat4UniformArray:= GetProcAddress(ADllHandle, 'sfShader_setMat4UniformArray');
  sfShader_setFloatParameter:= GetProcAddress(ADllHandle, 'sfShader_setFloatParameter');
  sfShader_setFloat2Parameter:= GetProcAddress(ADllHandle, 'sfShader_setFloat2Parameter');
  sfShader_setFloat3Parameter:= GetProcAddress(ADllHandle, 'sfShader_setFloat3Parameter');
  sfShader_setFloat4Parameter:= GetProcAddress(ADllHandle, 'sfShader_setFloat4Parameter');
  sfShader_setVector2Parameter:= GetProcAddress(ADllHandle, 'sfShader_setVector2Parameter');
  sfShader_setVector3Parameter:= GetProcAddress(ADllHandle, 'sfShader_setVector3Parameter');
  sfShader_setColorParameter:= GetProcAddress(ADllHandle, 'sfShader_setColorParameter');
  sfShader_setTransformParameter:= GetProcAddress(ADllHandle, 'sfShader_setTransformParameter');
  sfShader_setTextureParameter:= GetProcAddress(ADllHandle, 'sfShader_setTextureParameter');
  sfShader_setCurrentTextureParameter:= GetProcAddress(ADllHandle, 'sfShader_setCurrentTextureParameter');
  sfShader_getNativeHandle:= GetProcAddress(ADllHandle, 'sfShader_getNativeHandle');
  sfShader_bind:= GetProcAddress(ADllHandle, 'sfShader_bind');
  sfShader_isAvailable:= GetProcAddress(ADllHandle, 'sfShader_isAvailable');
  sfShader_isGeometryAvailable:= GetProcAddress(ADllHandle, 'sfShader_isGeometryAvailable');
  sfShape_create:= GetProcAddress(ADllHandle, 'sfShape_create');
  sfShape_destroy:= GetProcAddress(ADllHandle, 'sfShape_destroy');
  sfShape_setPosition:= GetProcAddress(ADllHandle, 'sfShape_setPosition');
  sfShape_setRotation:= GetProcAddress(ADllHandle, 'sfShape_setRotation');
  sfShape_setScale:= GetProcAddress(ADllHandle, 'sfShape_setScale');
  sfShape_setOrigin:= GetProcAddress(ADllHandle, 'sfShape_setOrigin');
  sfShape_getPosition:= GetProcAddress(ADllHandle, 'sfShape_getPosition');
  sfShape_getRotation:= GetProcAddress(ADllHandle, 'sfShape_getRotation');
  sfShape_getScale:= GetProcAddress(ADllHandle, 'sfShape_getScale');
  sfShape_getOrigin:= GetProcAddress(ADllHandle, 'sfShape_getOrigin');
  sfShape_move:= GetProcAddress(ADllHandle, 'sfShape_move');
  sfShape_rotate:= GetProcAddress(ADllHandle, 'sfShape_rotate');
  sfShape_scale:= GetProcAddress(ADllHandle, 'sfShape_scale');
  sfShape_getTransform:= GetProcAddress(ADllHandle, 'sfShape_getTransform');
  sfShape_getInverseTransform:= GetProcAddress(ADllHandle, 'sfShape_getInverseTransform');
  sfShape_setTexture:= GetProcAddress(ADllHandle, 'sfShape_setTexture');
  sfShape_setTextureRect:= GetProcAddress(ADllHandle, 'sfShape_setTextureRect');
  sfShape_setFillColor:= GetProcAddress(ADllHandle, 'sfShape_setFillColor');
  sfShape_setOutlineColor:= GetProcAddress(ADllHandle, 'sfShape_setOutlineColor');
  sfShape_setOutlineThickness:= GetProcAddress(ADllHandle, 'sfShape_setOutlineThickness');
  sfShape_getTexture:= GetProcAddress(ADllHandle, 'sfShape_getTexture');
  sfShape_getTextureRect:= GetProcAddress(ADllHandle, 'sfShape_getTextureRect');
  sfShape_getFillColor:= GetProcAddress(ADllHandle, 'sfShape_getFillColor');
  sfShape_getOutlineColor:= GetProcAddress(ADllHandle, 'sfShape_getOutlineColor');
  sfShape_getOutlineThickness:= GetProcAddress(ADllHandle, 'sfShape_getOutlineThickness');
  sfShape_getPointCount:= GetProcAddress(ADllHandle, 'sfShape_getPointCount');
  sfShape_getPoint:= GetProcAddress(ADllHandle, 'sfShape_getPoint');
  sfShape_getLocalBounds:= GetProcAddress(ADllHandle, 'sfShape_getLocalBounds');
  sfShape_getGlobalBounds:= GetProcAddress(ADllHandle, 'sfShape_getGlobalBounds');
  sfShape_update:= GetProcAddress(ADllHandle, 'sfShape_update');
  sfSprite_create:= GetProcAddress(ADllHandle, 'sfSprite_create');
  sfSprite_copy:= GetProcAddress(ADllHandle, 'sfSprite_copy');
  sfSprite_destroy:= GetProcAddress(ADllHandle, 'sfSprite_destroy');
  sfSprite_setPosition:= GetProcAddress(ADllHandle, 'sfSprite_setPosition');
  sfSprite_setRotation:= GetProcAddress(ADllHandle, 'sfSprite_setRotation');
  sfSprite_setScale:= GetProcAddress(ADllHandle, 'sfSprite_setScale');
  sfSprite_setOrigin:= GetProcAddress(ADllHandle, 'sfSprite_setOrigin');
  sfSprite_getPosition:= GetProcAddress(ADllHandle, 'sfSprite_getPosition');
  sfSprite_getRotation:= GetProcAddress(ADllHandle, 'sfSprite_getRotation');
  sfSprite_getScale:= GetProcAddress(ADllHandle, 'sfSprite_getScale');
  sfSprite_getOrigin:= GetProcAddress(ADllHandle, 'sfSprite_getOrigin');
  sfSprite_move:= GetProcAddress(ADllHandle, 'sfSprite_move');
  sfSprite_rotate:= GetProcAddress(ADllHandle, 'sfSprite_rotate');
  sfSprite_scale:= GetProcAddress(ADllHandle, 'sfSprite_scale');
  sfSprite_getTransform:= GetProcAddress(ADllHandle, 'sfSprite_getTransform');
  sfSprite_getInverseTransform:= GetProcAddress(ADllHandle, 'sfSprite_getInverseTransform');
  sfSprite_setTexture:= GetProcAddress(ADllHandle, 'sfSprite_setTexture');
  sfSprite_setTextureRect:= GetProcAddress(ADllHandle, 'sfSprite_setTextureRect');
  sfSprite_setColor:= GetProcAddress(ADllHandle, 'sfSprite_setColor');
  sfSprite_getTexture:= GetProcAddress(ADllHandle, 'sfSprite_getTexture');
  sfSprite_getTextureRect:= GetProcAddress(ADllHandle, 'sfSprite_getTextureRect');
  sfSprite_getColor:= GetProcAddress(ADllHandle, 'sfSprite_getColor');
  sfSprite_getLocalBounds:= GetProcAddress(ADllHandle, 'sfSprite_getLocalBounds');
  sfSprite_getGlobalBounds:= GetProcAddress(ADllHandle, 'sfSprite_getGlobalBounds');
  sfText_create:= GetProcAddress(ADllHandle, 'sfText_create');
  sfText_copy:= GetProcAddress(ADllHandle, 'sfText_copy');
  sfText_destroy:= GetProcAddress(ADllHandle, 'sfText_destroy');
  sfText_setPosition:= GetProcAddress(ADllHandle, 'sfText_setPosition');
  sfText_setRotation:= GetProcAddress(ADllHandle, 'sfText_setRotation');
  sfText_setScale:= GetProcAddress(ADllHandle, 'sfText_setScale');
  sfText_setOrigin:= GetProcAddress(ADllHandle, 'sfText_setOrigin');
  sfText_getPosition:= GetProcAddress(ADllHandle, 'sfText_getPosition');
  sfText_getRotation:= GetProcAddress(ADllHandle, 'sfText_getRotation');
  sfText_getScale:= GetProcAddress(ADllHandle, 'sfText_getScale');
  sfText_getOrigin:= GetProcAddress(ADllHandle, 'sfText_getOrigin');
  sfText_move:= GetProcAddress(ADllHandle, 'sfText_move');
  sfText_rotate:= GetProcAddress(ADllHandle, 'sfText_rotate');
  sfText_scale:= GetProcAddress(ADllHandle, 'sfText_scale');
  sfText_getTransform:= GetProcAddress(ADllHandle, 'sfText_getTransform');
  sfText_getInverseTransform:= GetProcAddress(ADllHandle, 'sfText_getInverseTransform');
  sfText_setString:= GetProcAddress(ADllHandle, 'sfText_setString');
  sfText_setUnicodeString:= GetProcAddress(ADllHandle, 'sfText_setUnicodeString');
  sfText_setFont:= GetProcAddress(ADllHandle, 'sfText_setFont');
  sfText_setCharacterSize:= GetProcAddress(ADllHandle, 'sfText_setCharacterSize');
  sfText_setLineSpacing:= GetProcAddress(ADllHandle, 'sfText_setLineSpacing');
  sfText_setLetterSpacing:= GetProcAddress(ADllHandle, 'sfText_setLetterSpacing');
  sfText_setStyle:= GetProcAddress(ADllHandle, 'sfText_setStyle');
  sfText_setColor:= GetProcAddress(ADllHandle, 'sfText_setColor');
  sfText_setFillColor:= GetProcAddress(ADllHandle, 'sfText_setFillColor');
  sfText_setOutlineColor:= GetProcAddress(ADllHandle, 'sfText_setOutlineColor');
  sfText_setOutlineThickness:= GetProcAddress(ADllHandle, 'sfText_setOutlineThickness');
  sfText_getString:= GetProcAddress(ADllHandle, 'sfText_getString');
  sfText_getUnicodeString:= GetProcAddress(ADllHandle, 'sfText_getUnicodeString');
  sfText_getFont:= GetProcAddress(ADllHandle, 'sfText_getFont');
  sfText_getCharacterSize:= GetProcAddress(ADllHandle, 'sfText_getCharacterSize');
  sfText_getLetterSpacing:= GetProcAddress(ADllHandle, 'sfText_getLetterSpacing');
  sfText_getLineSpacing:= GetProcAddress(ADllHandle, 'sfText_getLineSpacing');
  sfText_getStyle:= GetProcAddress(ADllHandle, 'sfText_getStyle');
  sfText_getColor:= GetProcAddress(ADllHandle, 'sfText_getColor');
  sfText_getFillColor:= GetProcAddress(ADllHandle, 'sfText_getFillColor');
  sfText_getOutlineColor:= GetProcAddress(ADllHandle, 'sfText_getOutlineColor');
  sfText_getOutlineThickness:= GetProcAddress(ADllHandle, 'sfText_getOutlineThickness');
  sfText_findCharacterPos:= GetProcAddress(ADllHandle, 'sfText_findCharacterPos');
  sfText_getLocalBounds:= GetProcAddress(ADllHandle, 'sfText_getLocalBounds');
  sfText_getGlobalBounds:= GetProcAddress(ADllHandle, 'sfText_getGlobalBounds');
  sfTexture_create:= GetProcAddress(ADllHandle, 'sfTexture_create');
  sfTexture_createFromFile:= GetProcAddress(ADllHandle, 'sfTexture_createFromFile');
  sfTexture_createSrgbFromFile:= GetProcAddress(ADllHandle, 'sfTexture_createSrgbFromFile');
  sfTexture_createFromMemory:= GetProcAddress(ADllHandle, 'sfTexture_createFromMemory');
  sfTexture_createSrgbFromMemory:= GetProcAddress(ADllHandle, 'sfTexture_createSrgbFromMemory');
  sfTexture_createFromStream:= GetProcAddress(ADllHandle, 'sfTexture_createFromStream');
  sfTexture_createSrgbFromStream:= GetProcAddress(ADllHandle, 'sfTexture_createSrgbFromStream');
  sfTexture_createFromImage:= GetProcAddress(ADllHandle, 'sfTexture_createFromImage');
  sfTexture_createSrgbFromImage:= GetProcAddress(ADllHandle, 'sfTexture_createSrgbFromImage');
  sfTexture_copy:= GetProcAddress(ADllHandle, 'sfTexture_copy');
  sfTexture_destroy:= GetProcAddress(ADllHandle, 'sfTexture_destroy');
  sfTexture_getSize:= GetProcAddress(ADllHandle, 'sfTexture_getSize');
  sfTexture_copyToImage:= GetProcAddress(ADllHandle, 'sfTexture_copyToImage');
  sfTexture_updateFromPixels:= GetProcAddress(ADllHandle, 'sfTexture_updateFromPixels');
  sfTexture_updateFromTexture:= GetProcAddress(ADllHandle, 'sfTexture_updateFromTexture');
  sfTexture_updateFromImage:= GetProcAddress(ADllHandle, 'sfTexture_updateFromImage');
  sfTexture_updateFromWindow:= GetProcAddress(ADllHandle, 'sfTexture_updateFromWindow');
  sfTexture_updateFromRenderWindow:= GetProcAddress(ADllHandle, 'sfTexture_updateFromRenderWindow');
  sfTexture_setSmooth:= GetProcAddress(ADllHandle, 'sfTexture_setSmooth');
  sfTexture_isSmooth:= GetProcAddress(ADllHandle, 'sfTexture_isSmooth');
  sfTexture_isSrgb:= GetProcAddress(ADllHandle, 'sfTexture_isSrgb');
  sfTexture_setRepeated:= GetProcAddress(ADllHandle, 'sfTexture_setRepeated');
  sfTexture_isRepeated:= GetProcAddress(ADllHandle, 'sfTexture_isRepeated');
  sfTexture_generateMipmap:= GetProcAddress(ADllHandle, 'sfTexture_generateMipmap');
  sfTexture_swap:= GetProcAddress(ADllHandle, 'sfTexture_swap');
  sfTexture_getNativeHandle:= GetProcAddress(ADllHandle, 'sfTexture_getNativeHandle');
  sfTexture_bind:= GetProcAddress(ADllHandle, 'sfTexture_bind');
  sfTexture_getMaximumSize:= GetProcAddress(ADllHandle, 'sfTexture_getMaximumSize');
  sfTransformable_create:= GetProcAddress(ADllHandle, 'sfTransformable_create');
  sfTransformable_copy:= GetProcAddress(ADllHandle, 'sfTransformable_copy');
  sfTransformable_destroy:= GetProcAddress(ADllHandle, 'sfTransformable_destroy');
  sfTransformable_setPosition:= GetProcAddress(ADllHandle, 'sfTransformable_setPosition');
  sfTransformable_setRotation:= GetProcAddress(ADllHandle, 'sfTransformable_setRotation');
  sfTransformable_setScale:= GetProcAddress(ADllHandle, 'sfTransformable_setScale');
  sfTransformable_setOrigin:= GetProcAddress(ADllHandle, 'sfTransformable_setOrigin');
  sfTransformable_getPosition:= GetProcAddress(ADllHandle, 'sfTransformable_getPosition');
  sfTransformable_getRotation:= GetProcAddress(ADllHandle, 'sfTransformable_getRotation');
  sfTransformable_getScale:= GetProcAddress(ADllHandle, 'sfTransformable_getScale');
  sfTransformable_getOrigin:= GetProcAddress(ADllHandle, 'sfTransformable_getOrigin');
  sfTransformable_move:= GetProcAddress(ADllHandle, 'sfTransformable_move');
  sfTransformable_rotate:= GetProcAddress(ADllHandle, 'sfTransformable_rotate');
  sfTransformable_scale:= GetProcAddress(ADllHandle, 'sfTransformable_scale');
  sfTransformable_getTransform:= GetProcAddress(ADllHandle, 'sfTransformable_getTransform');
  sfTransformable_getInverseTransform:= GetProcAddress(ADllHandle, 'sfTransformable_getInverseTransform');
  sfVertexArray_create:= GetProcAddress(ADllHandle, 'sfVertexArray_create');
  sfVertexArray_copy:= GetProcAddress(ADllHandle, 'sfVertexArray_copy');
  sfVertexArray_destroy:= GetProcAddress(ADllHandle, 'sfVertexArray_destroy');
  sfVertexArray_getVertexCount:= GetProcAddress(ADllHandle, 'sfVertexArray_getVertexCount');
  sfVertexArray_getVertex:= GetProcAddress(ADllHandle, 'sfVertexArray_getVertex');
  sfVertexArray_clear:= GetProcAddress(ADllHandle, 'sfVertexArray_clear');
  sfVertexArray_resize:= GetProcAddress(ADllHandle, 'sfVertexArray_resize');
  sfVertexArray_append:= GetProcAddress(ADllHandle, 'sfVertexArray_append');
  sfVertexArray_setPrimitiveType:= GetProcAddress(ADllHandle, 'sfVertexArray_setPrimitiveType');
  sfVertexArray_getPrimitiveType:= GetProcAddress(ADllHandle, 'sfVertexArray_getPrimitiveType');
  sfVertexArray_getBounds:= GetProcAddress(ADllHandle, 'sfVertexArray_getBounds');
  sfVertexBuffer_create:= GetProcAddress(ADllHandle, 'sfVertexBuffer_create');
  sfVertexBuffer_copy:= GetProcAddress(ADllHandle, 'sfVertexBuffer_copy');
  sfVertexBuffer_destroy:= GetProcAddress(ADllHandle, 'sfVertexBuffer_destroy');
  sfVertexBuffer_getVertexCount:= GetProcAddress(ADllHandle, 'sfVertexBuffer_getVertexCount');
  sfVertexBuffer_update:= GetProcAddress(ADllHandle, 'sfVertexBuffer_update');
  sfVertexBuffer_updateFromVertexBuffer:= GetProcAddress(ADllHandle, 'sfVertexBuffer_updateFromVertexBuffer');
  sfVertexBuffer_swap:= GetProcAddress(ADllHandle, 'sfVertexBuffer_swap');
  sfVertexBuffer_getNativeHandle:= GetProcAddress(ADllHandle, 'sfVertexBuffer_getNativeHandle');
  sfVertexBuffer_setPrimitiveType:= GetProcAddress(ADllHandle, 'sfVertexBuffer_setPrimitiveType');
  sfVertexBuffer_getPrimitiveType:= GetProcAddress(ADllHandle, 'sfVertexBuffer_getPrimitiveType');
  sfVertexBuffer_setUsage:= GetProcAddress(ADllHandle, 'sfVertexBuffer_setUsage');
  sfVertexBuffer_getUsage:= GetProcAddress(ADllHandle, 'sfVertexBuffer_getUsage');
  sfVertexBuffer_bind:= GetProcAddress(ADllHandle, 'sfVertexBuffer_bind');
  sfVertexBuffer_isAvailable:= GetProcAddress(ADllHandle, 'sfVertexBuffer_isAvailable');
  sfView_create:= GetProcAddress(ADllHandle, 'sfView_create');
  sfView_createFromRect:= GetProcAddress(ADllHandle, 'sfView_createFromRect');
  sfView_copy:= GetProcAddress(ADllHandle, 'sfView_copy');
  sfView_destroy:= GetProcAddress(ADllHandle, 'sfView_destroy');
  sfView_setCenter:= GetProcAddress(ADllHandle, 'sfView_setCenter');
  sfView_setSize:= GetProcAddress(ADllHandle, 'sfView_setSize');
  sfView_setRotation:= GetProcAddress(ADllHandle, 'sfView_setRotation');
  sfView_setViewport:= GetProcAddress(ADllHandle, 'sfView_setViewport');
  sfView_reset:= GetProcAddress(ADllHandle, 'sfView_reset');
  sfView_getCenter:= GetProcAddress(ADllHandle, 'sfView_getCenter');
  sfView_getSize:= GetProcAddress(ADllHandle, 'sfView_getSize');
  sfView_getRotation:= GetProcAddress(ADllHandle, 'sfView_getRotation');
  sfView_getViewport:= GetProcAddress(ADllHandle, 'sfView_getViewport');
  sfView_move:= GetProcAddress(ADllHandle, 'sfView_move');
  sfView_rotate:= GetProcAddress(ADllHandle, 'sfView_rotate');
  sfView_zoom:= GetProcAddress(ADllHandle, 'sfView_zoom');
  sfIpAddress_fromString:= GetProcAddress(ADllHandle, 'sfIpAddress_fromString');
  sfIpAddress_fromBytes:= GetProcAddress(ADllHandle, 'sfIpAddress_fromBytes');
  sfIpAddress_fromInteger:= GetProcAddress(ADllHandle, 'sfIpAddress_fromInteger');
  sfIpAddress_toString:= GetProcAddress(ADllHandle, 'sfIpAddress_toString');
  sfIpAddress_toInteger:= GetProcAddress(ADllHandle, 'sfIpAddress_toInteger');
  sfIpAddress_getLocalAddress:= GetProcAddress(ADllHandle, 'sfIpAddress_getLocalAddress');
  sfIpAddress_getPublicAddress:= GetProcAddress(ADllHandle, 'sfIpAddress_getPublicAddress');
  sfFtpListingResponse_destroy:= GetProcAddress(ADllHandle, 'sfFtpListingResponse_destroy');
  sfFtpListingResponse_isOk:= GetProcAddress(ADllHandle, 'sfFtpListingResponse_isOk');
  sfFtpListingResponse_getStatus:= GetProcAddress(ADllHandle, 'sfFtpListingResponse_getStatus');
  sfFtpListingResponse_getMessage:= GetProcAddress(ADllHandle, 'sfFtpListingResponse_getMessage');
  sfFtpListingResponse_getCount:= GetProcAddress(ADllHandle, 'sfFtpListingResponse_getCount');
  sfFtpListingResponse_getName:= GetProcAddress(ADllHandle, 'sfFtpListingResponse_getName');
  sfFtpDirectoryResponse_destroy:= GetProcAddress(ADllHandle, 'sfFtpDirectoryResponse_destroy');
  sfFtpDirectoryResponse_isOk:= GetProcAddress(ADllHandle, 'sfFtpDirectoryResponse_isOk');
  sfFtpDirectoryResponse_getStatus:= GetProcAddress(ADllHandle, 'sfFtpDirectoryResponse_getStatus');
  sfFtpDirectoryResponse_getMessage:= GetProcAddress(ADllHandle, 'sfFtpDirectoryResponse_getMessage');
  sfFtpDirectoryResponse_getDirectory:= GetProcAddress(ADllHandle, 'sfFtpDirectoryResponse_getDirectory');
  sfFtpResponse_destroy:= GetProcAddress(ADllHandle, 'sfFtpResponse_destroy');
  sfFtpResponse_isOk:= GetProcAddress(ADllHandle, 'sfFtpResponse_isOk');
  sfFtpResponse_getStatus:= GetProcAddress(ADllHandle, 'sfFtpResponse_getStatus');
  sfFtpResponse_getMessage:= GetProcAddress(ADllHandle, 'sfFtpResponse_getMessage');
  sfFtp_create:= GetProcAddress(ADllHandle, 'sfFtp_create');
  sfFtp_destroy:= GetProcAddress(ADllHandle, 'sfFtp_destroy');
  sfFtp_connect:= GetProcAddress(ADllHandle, 'sfFtp_connect');
  sfFtp_loginAnonymous:= GetProcAddress(ADllHandle, 'sfFtp_loginAnonymous');
  sfFtp_login:= GetProcAddress(ADllHandle, 'sfFtp_login');
  sfFtp_disconnect:= GetProcAddress(ADllHandle, 'sfFtp_disconnect');
  sfFtp_keepAlive:= GetProcAddress(ADllHandle, 'sfFtp_keepAlive');
  sfFtp_getWorkingDirectory:= GetProcAddress(ADllHandle, 'sfFtp_getWorkingDirectory');
  sfFtp_getDirectoryListing:= GetProcAddress(ADllHandle, 'sfFtp_getDirectoryListing');
  sfFtp_changeDirectory:= GetProcAddress(ADllHandle, 'sfFtp_changeDirectory');
  sfFtp_parentDirectory:= GetProcAddress(ADllHandle, 'sfFtp_parentDirectory');
  sfFtp_createDirectory:= GetProcAddress(ADllHandle, 'sfFtp_createDirectory');
  sfFtp_deleteDirectory:= GetProcAddress(ADllHandle, 'sfFtp_deleteDirectory');
  sfFtp_renameFile:= GetProcAddress(ADllHandle, 'sfFtp_renameFile');
  sfFtp_deleteFile:= GetProcAddress(ADllHandle, 'sfFtp_deleteFile');
  sfFtp_download:= GetProcAddress(ADllHandle, 'sfFtp_download');
  sfFtp_upload:= GetProcAddress(ADllHandle, 'sfFtp_upload');
  sfFtp_sendCommand:= GetProcAddress(ADllHandle, 'sfFtp_sendCommand');
  sfHttpRequest_create:= GetProcAddress(ADllHandle, 'sfHttpRequest_create');
  sfHttpRequest_destroy:= GetProcAddress(ADllHandle, 'sfHttpRequest_destroy');
  sfHttpRequest_setField:= GetProcAddress(ADllHandle, 'sfHttpRequest_setField');
  sfHttpRequest_setMethod:= GetProcAddress(ADllHandle, 'sfHttpRequest_setMethod');
  sfHttpRequest_setUri:= GetProcAddress(ADllHandle, 'sfHttpRequest_setUri');
  sfHttpRequest_setHttpVersion:= GetProcAddress(ADllHandle, 'sfHttpRequest_setHttpVersion');
  sfHttpRequest_setBody:= GetProcAddress(ADllHandle, 'sfHttpRequest_setBody');
  sfHttpResponse_destroy:= GetProcAddress(ADllHandle, 'sfHttpResponse_destroy');
  sfHttpResponse_getField:= GetProcAddress(ADllHandle, 'sfHttpResponse_getField');
  sfHttpResponse_getStatus:= GetProcAddress(ADllHandle, 'sfHttpResponse_getStatus');
  sfHttpResponse_getMajorVersion:= GetProcAddress(ADllHandle, 'sfHttpResponse_getMajorVersion');
  sfHttpResponse_getMinorVersion:= GetProcAddress(ADllHandle, 'sfHttpResponse_getMinorVersion');
  sfHttpResponse_getBody:= GetProcAddress(ADllHandle, 'sfHttpResponse_getBody');
  sfHttp_create:= GetProcAddress(ADllHandle, 'sfHttp_create');
  sfHttp_destroy:= GetProcAddress(ADllHandle, 'sfHttp_destroy');
  sfHttp_setHost:= GetProcAddress(ADllHandle, 'sfHttp_setHost');
  sfHttp_sendRequest:= GetProcAddress(ADllHandle, 'sfHttp_sendRequest');
  sfPacket_create:= GetProcAddress(ADllHandle, 'sfPacket_create');
  sfPacket_copy:= GetProcAddress(ADllHandle, 'sfPacket_copy');
  sfPacket_destroy:= GetProcAddress(ADllHandle, 'sfPacket_destroy');
  sfPacket_append:= GetProcAddress(ADllHandle, 'sfPacket_append');
  sfPacket_getReadPosition:= GetProcAddress(ADllHandle, 'sfPacket_getReadPosition');
  sfPacket_clear:= GetProcAddress(ADllHandle, 'sfPacket_clear');
  sfPacket_getData:= GetProcAddress(ADllHandle, 'sfPacket_getData');
  sfPacket_getDataSize:= GetProcAddress(ADllHandle, 'sfPacket_getDataSize');
  sfPacket_endOfPacket:= GetProcAddress(ADllHandle, 'sfPacket_endOfPacket');
  sfPacket_canRead:= GetProcAddress(ADllHandle, 'sfPacket_canRead');
  sfPacket_readBool:= GetProcAddress(ADllHandle, 'sfPacket_readBool');
  sfPacket_readInt8:= GetProcAddress(ADllHandle, 'sfPacket_readInt8');
  sfPacket_readUint8:= GetProcAddress(ADllHandle, 'sfPacket_readUint8');
  sfPacket_readInt16:= GetProcAddress(ADllHandle, 'sfPacket_readInt16');
  sfPacket_readUint16:= GetProcAddress(ADllHandle, 'sfPacket_readUint16');
  sfPacket_readInt32:= GetProcAddress(ADllHandle, 'sfPacket_readInt32');
  sfPacket_readUint32:= GetProcAddress(ADllHandle, 'sfPacket_readUint32');
  sfPacket_readFloat:= GetProcAddress(ADllHandle, 'sfPacket_readFloat');
  sfPacket_readDouble:= GetProcAddress(ADllHandle, 'sfPacket_readDouble');
  sfPacket_readString:= GetProcAddress(ADllHandle, 'sfPacket_readString');
  sfPacket_readWideString:= GetProcAddress(ADllHandle, 'sfPacket_readWideString');
  sfPacket_writeBool:= GetProcAddress(ADllHandle, 'sfPacket_writeBool');
  sfPacket_writeInt8:= GetProcAddress(ADllHandle, 'sfPacket_writeInt8');
  sfPacket_writeUint8:= GetProcAddress(ADllHandle, 'sfPacket_writeUint8');
  sfPacket_writeInt16:= GetProcAddress(ADllHandle, 'sfPacket_writeInt16');
  sfPacket_writeUint16:= GetProcAddress(ADllHandle, 'sfPacket_writeUint16');
  sfPacket_writeInt32:= GetProcAddress(ADllHandle, 'sfPacket_writeInt32');
  sfPacket_writeUint32:= GetProcAddress(ADllHandle, 'sfPacket_writeUint32');
  sfPacket_writeFloat:= GetProcAddress(ADllHandle, 'sfPacket_writeFloat');
  sfPacket_writeDouble:= GetProcAddress(ADllHandle, 'sfPacket_writeDouble');
  sfPacket_writeString:= GetProcAddress(ADllHandle, 'sfPacket_writeString');
  sfPacket_writeWideString:= GetProcAddress(ADllHandle, 'sfPacket_writeWideString');
  sfSocketSelector_create:= GetProcAddress(ADllHandle, 'sfSocketSelector_create');
  sfSocketSelector_copy:= GetProcAddress(ADllHandle, 'sfSocketSelector_copy');
  sfSocketSelector_destroy:= GetProcAddress(ADllHandle, 'sfSocketSelector_destroy');
  sfSocketSelector_addTcpListener:= GetProcAddress(ADllHandle, 'sfSocketSelector_addTcpListener');
  sfSocketSelector_addTcpSocket:= GetProcAddress(ADllHandle, 'sfSocketSelector_addTcpSocket');
  sfSocketSelector_addUdpSocket:= GetProcAddress(ADllHandle, 'sfSocketSelector_addUdpSocket');
  sfSocketSelector_removeTcpListener:= GetProcAddress(ADllHandle, 'sfSocketSelector_removeTcpListener');
  sfSocketSelector_removeTcpSocket:= GetProcAddress(ADllHandle, 'sfSocketSelector_removeTcpSocket');
  sfSocketSelector_removeUdpSocket:= GetProcAddress(ADllHandle, 'sfSocketSelector_removeUdpSocket');
  sfSocketSelector_clear:= GetProcAddress(ADllHandle, 'sfSocketSelector_clear');
  sfSocketSelector_wait:= GetProcAddress(ADllHandle, 'sfSocketSelector_wait');
  sfSocketSelector_isTcpListenerReady:= GetProcAddress(ADllHandle, 'sfSocketSelector_isTcpListenerReady');
  sfSocketSelector_isTcpSocketReady:= GetProcAddress(ADllHandle, 'sfSocketSelector_isTcpSocketReady');
  sfSocketSelector_isUdpSocketReady:= GetProcAddress(ADllHandle, 'sfSocketSelector_isUdpSocketReady');
  sfTcpListener_create:= GetProcAddress(ADllHandle, 'sfTcpListener_create');
  sfTcpListener_destroy:= GetProcAddress(ADllHandle, 'sfTcpListener_destroy');
  sfTcpListener_setBlocking:= GetProcAddress(ADllHandle, 'sfTcpListener_setBlocking');
  sfTcpListener_isBlocking:= GetProcAddress(ADllHandle, 'sfTcpListener_isBlocking');
  sfTcpListener_getLocalPort:= GetProcAddress(ADllHandle, 'sfTcpListener_getLocalPort');
  sfTcpListener_listen:= GetProcAddress(ADllHandle, 'sfTcpListener_listen');
  sfTcpListener_accept:= GetProcAddress(ADllHandle, 'sfTcpListener_accept');
  sfTcpSocket_create:= GetProcAddress(ADllHandle, 'sfTcpSocket_create');
  sfTcpSocket_destroy:= GetProcAddress(ADllHandle, 'sfTcpSocket_destroy');
  sfTcpSocket_setBlocking:= GetProcAddress(ADllHandle, 'sfTcpSocket_setBlocking');
  sfTcpSocket_isBlocking:= GetProcAddress(ADllHandle, 'sfTcpSocket_isBlocking');
  sfTcpSocket_getLocalPort:= GetProcAddress(ADllHandle, 'sfTcpSocket_getLocalPort');
  sfTcpSocket_getRemoteAddress:= GetProcAddress(ADllHandle, 'sfTcpSocket_getRemoteAddress');
  sfTcpSocket_getRemotePort:= GetProcAddress(ADllHandle, 'sfTcpSocket_getRemotePort');
  sfTcpSocket_connect:= GetProcAddress(ADllHandle, 'sfTcpSocket_connect');
  sfTcpSocket_disconnect:= GetProcAddress(ADllHandle, 'sfTcpSocket_disconnect');
  sfTcpSocket_send:= GetProcAddress(ADllHandle, 'sfTcpSocket_send');
  sfTcpSocket_sendPartial:= GetProcAddress(ADllHandle, 'sfTcpSocket_sendPartial');
  sfTcpSocket_receive:= GetProcAddress(ADllHandle, 'sfTcpSocket_receive');
  sfTcpSocket_sendPacket:= GetProcAddress(ADllHandle, 'sfTcpSocket_sendPacket');
  sfTcpSocket_receivePacket:= GetProcAddress(ADllHandle, 'sfTcpSocket_receivePacket');
  sfUdpSocket_create:= GetProcAddress(ADllHandle, 'sfUdpSocket_create');
  sfUdpSocket_destroy:= GetProcAddress(ADllHandle, 'sfUdpSocket_destroy');
  sfUdpSocket_setBlocking:= GetProcAddress(ADllHandle, 'sfUdpSocket_setBlocking');
  sfUdpSocket_isBlocking:= GetProcAddress(ADllHandle, 'sfUdpSocket_isBlocking');
  sfUdpSocket_getLocalPort:= GetProcAddress(ADllHandle, 'sfUdpSocket_getLocalPort');
  sfUdpSocket_bind:= GetProcAddress(ADllHandle, 'sfUdpSocket_bind');
  sfUdpSocket_unbind:= GetProcAddress(ADllHandle, 'sfUdpSocket_unbind');
  sfUdpSocket_send:= GetProcAddress(ADllHandle, 'sfUdpSocket_send');
  sfUdpSocket_receive:= GetProcAddress(ADllHandle, 'sfUdpSocket_receive');
  sfUdpSocket_sendPacket:= GetProcAddress(ADllHandle, 'sfUdpSocket_sendPacket');
  sfUdpSocket_receivePacket:= GetProcAddress(ADllHandle, 'sfUdpSocket_receivePacket');
  sfUdpSocket_maxDatagramSize:= GetProcAddress(ADllHandle, 'sfUdpSocket_maxDatagramSize');
end;
{$ENDREGION}

{$REGION ' Load DLL '}
var
  DllHandle: THandle = 0;
  DllFilename: string = '';

function GetTempPath: string;
var
  LTmp: array[0..MAX_PATH] of Char;
  LLen: Integer;
begin
  SetLastError(ERROR_SUCCESS);

  LLen := Windows.GetTempPath(MAX_PATH, LTmp);
  if LLen <> 0 then
  begin
    LLen := GetLongPathName(LTmp, nil, 0);
    SetLength(Result, LLen - 1);
    GetLongPathName(LTmp, PChar(Result), LLen);
  end
  else
    Result := '';
end;

function GetTempGUIDFileName: string;
var
  LGuid: TGUID;
begin
  Result := '';
  if CreateGUID(LGuid) = S_OK then
  begin
    Result := GUIDToString(LGuid);
    Result := Copy(Result, 2, Length(Result) - 1 - 1);
    Result := ReplaceStr(Result, '-', '');
    Result := LowerCase(Result);
    Result := GetTempPath + Result + '.tmp';
  end;
end;

procedure AbortDLL;
begin
  if DLLHandle <> 0 then
  begin
    FreeLibrary(DllHandle);
    DllHandle := 0;
  end;

  if FileExists(DllFilename) then
    DeleteFile(DllFilename);

  Halt;
end;

procedure LoadDLL;
const
  cDllResName = '85fe0b6b677849ab9e432071d44d4b4b';
var
  LResStream: TResourceStream;
begin
  if DllHandle <> 0 then Exit;
  if not Boolean((FindResource(HInstance, PChar(cDllResName), RT_RCDATA) <> 0)) then AbortDLL;
  LResStream := TResourceStream.Create(HInstance, cDLLResName, RT_RCDATA);
  try
    LResStream.Position := 0;
    DllFilename := GetTempGUIDFilename;
    LResStream.SaveToFile(DllFilename);
    if not FileExists(DllFilename) then AbortDLL;
    DllHandle := LoadLibrary(PChar(DllFilename));
    if DLLHandle = 0 then AbortDLL;

  finally
    LResStream.Free;
  end;
  if DllHandle = 0 then Exit;
  GetExports(DllHandle);
end;

procedure UnloadDLL;
begin
  if DllHandle = 0 then Exit;
  FreeLibrary(DllHandle);
  DeleteFile(DllFilename);
  DllHandle := 0
end;
{$ENDREGION}

initialization
  ReportMemoryLeaksOnShutdown := True;
  LoadDLL;

finalization
  UnloadDLL;

end.
