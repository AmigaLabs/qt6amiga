#############################################################################
##
## Copyright (C) 2021 The Qt Company Ltd.
## Contact: https://www.qt.io/licensing/
##
## This file is part of the provisioning scripts of the Qt Toolkit.
##
## $QT_BEGIN_LICENSE:LGPL$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see https://www.qt.io/terms-conditions. For further
## information use the contact form at https://www.qt.io/contact-us.
##
## GNU Lesser General Public License Usage
## Alternatively, this file may be used under the terms of the GNU Lesser
## General Public License version 3 as published by the Free Software
## Foundation and appearing in the file LICENSE.LGPL3 included in the
## packaging of this file. Please review the following information to
## ensure the GNU Lesser General Public License version 3 requirements
## will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
##
## GNU General Public License Usage
## Alternatively, this file may be used under the terms of the GNU
## General Public License version 2.0 or (at your option) the GNU General
## Public license version 3 or any later version approved by the KDE Free
## Qt Foundation. The licenses are as published by the Free Software
## Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
## included in the packaging of this file. Please review the following
## information to ensure the GNU General Public License requirements will
## be met: https://www.gnu.org/licenses/gpl-2.0.html and
## https://www.gnu.org/licenses/gpl-3.0.html.
##
## $QT_END_LICENSE$
##
#############################################################################

. "$PSScriptRoot\..\common\windows\helpers.ps1"

# This script installs LLVM-Mingw by mstorsjo

$zip = Get-DownloadLocation "llvm-mingw-20210423-ucrt-x86_64.zip"
$url_cache = "http://ci-files01-hki.intra.qt.io/input/windows/llvm-mingw-20210423-ucrt-x86_64.zip"
$url_official = "https://github.com/mstorsjo/llvm-mingw/releases/download/20210423/llvm-mingw-20210423-ucrt-x86_64.zip"

Download $url_official $url_cache $zip
Verify-Checksum $zip "da9fb1e4a74747b6c410240cec0d488e428fd338"
Extract-7Zip $zip C:\

Rename-Item C:\llvm-mingw-20210423-ucrt-x86_64 C:\llvm-mingw

# Due to https://github.com/mstorsjo/llvm-mingw/issues/199
Remove-Item C:\llvm-mingw\aarch64-w64-mingw32\lib\libc++.dll.a
Remove-Item C:\llvm-mingw\x86_64-w64-mingw32\lib\libc++.dll.a
Remove-Item C:\llvm-mingw\armv7-w64-mingw32\lib\libc++.dll.a
Remove-Item C:\llvm-mingw\i686-w64-mingw32\lib\libc++.dll.a

Write-Output "llvm-mingw = 12" >> ~/versions.txt
Remove-Item -Path $zip
