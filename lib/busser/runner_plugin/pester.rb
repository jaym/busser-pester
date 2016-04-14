# Author:: Jay Mundrawala (<jdmundrawala@gmail.com>)
#
# Copyright (C) 2014, Jay Mundrawala
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'busser/runner_plugin'
require 'rbconfig'

class Busser::RunnerPlugin::Pester < Busser::RunnerPlugin::Base
  postinstall do
    banner "[pester] Installing PsGet"
    download_psget = <<-DOWNLOADPSGET 
      #{powershell} -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command "if (-not (get-module -list pester)) {iex (new-object Net.WebClient).DownloadString('http://bit.ly/GetPsGet')}"
    DOWNLOADPSGET
    run!(download_psget)
    banner "[pester] Installing Pester"
    download_pester = <<-DOWNLOADPESTER 
      #{powershell} -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command "if (-not (get-module -list pester)) {Import-Module PsGet; Install-Module Pester}"
    DOWNLOADPESTER
    run!(download_pester)
  end

  def test
    banner "[pester] Running"
    pester_path = suite_path('pester').to_s
    Dir.chdir(pester_path) do
      run!("#{powershell} -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command \"Import-Module Pester; write-host ''; Invoke-Pester -EnableExit\"")
    end
  end

  private

  def powershell
    case RbConfig::CONFIG['host_vendor']
    when 'w64' # 64-bit Ruby
      'c:\windows\system32\windowspowershell\v1.0\powershell.exe'
    else # Assume 32-bit Ruby
      'c:\windows\sysnative\windowspowershell\v1.0\powershell.exe'
    end
  end
end
