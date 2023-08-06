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

unit PSFML.Utils;

{$I PSFML.Defines.inc}

interface

uses
  Windows,
  Messages,
  PSFML.Core;

function  Vector2f(aX, aY: Single): sfVector2f;
procedure SetLetterBoxView(aView: PsfView; aWindowWidth, aWindowHeight: Integer);
function  CreateView(aWindowWidth, aWindowHeight: Integer): PsfView;
function  GetScreenWorkAreaSize: sfVector2i;
procedure ScaleWindowToMonitor(aWindow: PsfRenderWindow; aDefaultDPI: Integer=96);
procedure SetDefaultIcon(aWindow: PsfRenderWindow);

implementation

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

end.
