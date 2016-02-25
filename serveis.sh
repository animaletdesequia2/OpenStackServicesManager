#!/bin/bash
#coding=utf8 
#aaaaaa
#       
#       Copyright 2015 Dàrent <darent@alfantech.tk>
#       
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#       
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#       
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.

# Bash colors for status:
red='\033[0;31m'
green='\033[0;32m'
nocolor='\e[00m'

echo
echo -e "$green            ###################################################"
echo -e "$green            #         Script de control del servidor.         #"
echo -e "$green            ###################################################"
echo



## Check Status Scripts:
# Apache2:
function IsApacheOn(){
	apachestatus=`service apache2 status | cut -d " " -f 5`
	if [ "$apachestatus" == "running" ]
		then
			colorapache=$green
			apache="SI"
		else
			colorapache=$red
			apache="NO"
	fi
	}
# HAproxy:
function IsHAproxyOn(){
	haproxystatus=`service haproxy status | tr "." " " | tr -s " " | cut -d " " -f 2`
	if [ "$haproxystatus" == "not" ]
		then
			colorhaproxy=$red
			haproxy="NO"
		else
			colorhaproxy=$green
			haproxy="SI"
	fi
	}
# glance-registry:
function IsGlanceRegistryOn(){
	glanceregistrystatus=`service glance-registry status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$glanceregistrystatus" == "start" ]
		then
			colorglanceregistry=$green
			glanceregistry="SI"
		else
			colorglanceregistry=$red
			glanceregistry="NO"
	fi
	}
# glance-api:
function IsGlanceApiOn(){
	glanceapistatus=`service glance-api status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$glanceapistatus" == "start" ]
		then
			colorglanceapi=$green
			glanceapi="SI"
		else
			colorglanceapi=$red
			glanceapi="NO"
	fi
	}
# keystone:
function IsKeystoneOn(){
	keystonestatus=`service keystone status | tr "/" " " | cut -d " " -f 2`
	if [ "$keystonestatus" == "start" ]
		then
			colorkeystone=$green
			keystone="SI"
		else
			colorkeystone=$red
			keystone="NO"
	fi
	}
# nova-api:
function IsNovaApiOn(){
	novaapistatus=`service nova-api status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$novaapistatus" == "start" ]
		then
			colornovaapi=$green
			novaapi="SI"
		else
			colornovaapi=$red
			novaapi="NO"
	fi
	}

# nova-cert:
function IsNovaCertOn(){
	novacertstatus=`service nova-cert status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$novacertstatus" == "start" ]
		then
			colornovacert=$green
			novacert="SI"
		else
			colornovacert=$red
			novacert="NO"
	fi
	}

# nova-consoleauth:
function IsNovaConsoleauthOn(){
	novaconsoleauthstatus=`service nova-consoleauth status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$novaconsoleauthstatus" == "start" ]
		then
			colornovaconsoleauth=$green
			novaconsoleauth="SI"
		else
			colornovaconsoleauth=$red
			novaconsoleauth="NO"
	fi
	}

# nova-scheduler:
function IsNovaSchedulerOn(){
	novaschedulerstatus=`service nova-scheduler status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$novaschedulerstatus" == "start" ]
		then
			colornovascheduler=$green
			novascheduler="SI"
		else
			colornovascheduler=$red
			novascheduler="NO"
	fi
	}

# nova-conductor:
function IsNovaConductorOn(){
	novaconductorstatus=`service nova-conductor status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$novaconductorstatus" == "start" ]
		then
			colornovaconductor=$green
			novaconductor="SI"
		else
			colornovaconductor=$red
			novaconductor="NO"
	fi
	}

# nova-novncproxy:
function IsNovaNovncproxyOn(){
	novanovncproxystatus=`service nova-novncproxy status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$novanovncproxystatus" == "start" ]
		then
			colornovanovncproxy=$green
			novanovncproxy="SI"
		else
			colornovanovncproxy=$red
			novanovncproxy="NO"
	fi
	}

# neutron-server:
function IsNeutronServerOn(){
	neutronserverstatus=`service neutron-server status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$neutronserverstatus" == "start" ]
		then
			colorneutronserver=$green
			neutronserver="SI"
		else
			colorneutronserver=$red
			neutronserver="NO"
	fi
	}

# neutron-l3-agent:
function IsNeutronL3agentOn(){
	neutronl3agentstatus=`service neutron-l3-agent status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$neutronl3agentstatus" == "start" ]
		then
			colorneutronl3agent=$green
			neutronl3agent="SI"
		else
			colorneutronl3agent=$red
			neutronl3agent="NO"
	fi
	}

# neutron-metadata-agent:
function IsNeutronMetadataagentOn(){
	neutronmetadataagentstatus=`service neutron-metadata-agent status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$neutronmetadataagentstatus" == "start" ]
		then
			colorneutronmetadataagent=$green
			neutronmetadataagent="SI"
		else
			colorneutronmetadataagent=$red
			neutronmetadataagent="NO"
	fi
	}

# neutron-lbaas-agent:
function IsNeutronLbaasOn(){
	neutronlbaasstatus=`service neutron-lbaas-agent status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$neutronlbaasstatus" == "start" ]
		then
			colorneutronlbaas=$green
			neutronlbaas="SI"
		else
			colorneutronlbaas=$red
			neutronlbaas="NO"
	fi
	}

# neutron-dhcp-agent:
function IsNeutronDhcpOn(){
	neutrondhcpstatus=`service neutron-dhcp-agent status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$neutrondhcpstatus" == "start" ]
		then
			colorneutrondhcp=$green
			neutrondhcp="SI"
		else
			colorneutrondhcp=$red
			neutrondhcp="NO"
	fi
	}

# ovsdb-server:
function IsOpenvswitchOn(){
	openvswitchstatus=`service openvswitch-switch status | grep server | cut -d " " -f 3`
	if [ "$openvswitchstatus" == "running" ]
		then
			coloropenvswitch=$green
			openvswitch="SI"
		else
			coloropenvswitch=$red
			openvswitch="NO"
	fi
	}



# ovs-vswitchd:

# ceilometer-agent-central:
function IsCeilometerCentralOn(){
	ceilometercentralstatus=`service ceilometer-agent-central status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$ceilometercentralstatus" == "start" ]
		then
			colorceilometercentral=$green
			ceilometercentral="SI"
		else
			colorceilometercentral=$red
			ceilometercentral="NO"
	fi
	}

# ceilometer-agent-notification:
function IsCeilometerNotificationOn(){
	ceilometernotificationstatus=`service ceilometer-agent-notification status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$ceilometernotificationstatus" == "start" ]
		then
			colorceilometernotification=$green
			ceilometernotification="SI"
		else
			colorceilometernotification=$red
			ceilometernotification="NO"
	fi
	}

# ceilometer-api:
function IsCeilometerApiOn(){
	ceilometerapistatus=`service ceilometer-api status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$ceilometerapistatus" == "start" ]
		then
			colorceilometerapi=$green
			ceilometerapi="SI"
		else
			colorceilometerapi=$red
			ceilometerapi="NO"
	fi
	}

# ceilometer-collector:
function IsCeilometerCollectorOn(){
	ceilometercollectorstatus=`service ceilometer-collector status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$ceilometercollectorstatus" == "start" ]
		then
			colorceilometercollector=$green
			ceilometercollector="SI"
		else
			colorceilometercollector=$red
			ceilometercollector="NO"
	fi
	}

# ceilometer-alarm-evaluator:
function IsCeilometerAlarmevaluatorOn(){
	ceilometeralarmevaluatorstatus=`service ceilometer-alarm-evaluator status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$ceilometeralarmevaluatorstatus" == "start" ]
		then
			colorceilometeralarmevaluator=$green
			ceilometeralarmevaluator="SI"
		else
			colorceilometeralarmevaluator=$red
			ceilometeralarmevaluator="NO"
	fi
	}

# ceilometer-alarm-notifier:
function IsCeilometerAlarmnotifierOn(){
	ceilometeralarmnotifierstatus=`service ceilometer-alarm-notifier status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$ceilometeralarmnotifierstatus" == "start" ]
		then
			colorceilometeralarmnotifier=$green
			ceilometeralarmnotifier="SI"
		else
			colorceilometeralarmnotifier=$red
			ceilometeralarmnotifier="NO"
	fi
	}

# cinder-api:
function IsCinderApiOn(){
        cinderapistatus=`service cinder-api status | tr "/" " " | tr -s " " | cut -d " " -f 2`
        if [ "$cinderapistatus" == "start" ]
                then
                        colorcinderapi=$green
                        cinderapi="SI"
                else
                        colorcinderapi=$red
                        cinderapi="NO"
        fi
        }

# heat-api:
function IsHeatApiOn(){
	heatapistatus=`service heat-api status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$heatapistatus" == "start" ]
		then
			colorheatapi=$green
			heatapi="SI"
		else
			colorheatapi=$red
			heatapi="NO"
	fi
	}
# heat-api-cfn:
function IsHeatApiCfnOn(){
	heatapicfnstatus=`service heat-api-cfn status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$heatapicfnstatus" == "start" ]
		then
			colorheatcfn=$green
			heatcfn="SI"
		else
			colorheatcfn=$red
			heatcfn="NO"
	fi
	}
# heat-api-cloudwatch:
function IsHeatApiCloudOn(){
	heatapicloudstatus=`service heat-api-cloudwatch status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$heatapicloudstatus" == "start" ]
		then
			colorheatcloud=$green
			heatcloud="SI"
		else
			colorheatcloud=$red
			heatcloud="NO"
	fi
	}
# heat-engine:
function IsHeatEngineOn(){
	heatenginestatus=`service heat-engine status | tr "/" " " | tr -s " " | cut -d " " -f 2`
	if [ "$heatenginestatus" == "start" ]
		then
			colorheatengine=$green
			heatengine="SI"
		else
			colorheatengine=$red
			heatengine="NO"
	fi
	}

# openstack-murano-api:
function IsMuranoApiOn(){
        muranoapistatus=`service openstack-murano-api status | tr "/" " " | tr -s " " | cut -d " " -f 5`
        if [ "$muranoapistatus" == "running" ]
                then
                        colormuranoapi=$green
                        muranoapi="SI"
                else
                        colormuranoapi=$red
                        muranoapi="NO"
        fi
        }
# openstack-murano-engine:
function IsMuranoEngineOn(){
        muranoenginestatus=`service openstack-murano-engine status | tr "/" " " | tr -s " " | cut -d " " -f 5`
        if [ "$muranoenginestatus" == "running" ]
                then
                        colormuranoengine=$green
                        muranoengine="SI"
                else
                        colormuranoengine=$red
                        muranoengine="NO"
        fi
        }



















while [ "$opcio" !=  "qqq" ]
do
echo -e "$red Serveis Web$nocolor:"
IsApacheOn
echo -e "   Esta apache2 en marxa?                         $colorapache $apache\033[0m. Introdueix \e[00;31mapa\e[00m per canviar l'estat."
IsHAproxyOn
echo -e "   Esta haproxy en marxa?                         $colorhaproxy $haproxy\033[0m. Introdueix \e[00;31mhap\e[00m per canviar l'estat."
echo -e "$red Serveis Glance$nocolor:"
IsGlanceRegistryOn
echo -e "   Esta glance-registry en marxa?                 $colorglanceregistry $glanceregistry\033[0m. Introdueix \e[00;31mglr\e[00m per canviar l'estat."
IsGlanceApiOn
echo -e "   Esta glance-api en marxa?                      $colorglanceapi $glanceapi\033[0m. Introdueix \e[00;31mgla\e[00m per canviar l'estat."
IsKeystoneOn
echo -e "$red Servei Keystone$nocolor:"
echo -e "   Esta keystone en marxa?                        $colorkeystone $keystone\033[0m. Introdueix \e[00;31mkey\e[00m per canviar l'estat."
echo -e "$red Serveis Nova$nocolor:"
IsNovaApiOn
echo -e "   Esta nova-api en marxa?                        $colornovaapi $novaapi\033[0m. Introdueix \e[00;31mnap\e[00m per canviar l'estat."
IsNovaCertOn
echo -e "   Esta nova-cert en marxa?                       $colornovacert $novacert\033[0m. Introdueix \e[00;31mnce\e[00m per canviar l'estat."
IsNovaConsoleauthOn
echo -e "   Esta nova-consoleauth en marxa?                $colornovaconsoleauth $novaconsoleauth\033[0m. Introdueix \e[00;31mnco\e[00m per canviar l'estat."
IsNovaSchedulerOn
echo -e "   Esta nova-scheduler en marxa?                  $colornovascheduler $novascheduler\033[0m. Introdueix \e[00;31mnsc\e[00m per canviar l'estat."
IsNovaConductorOn
echo -e "   Esta nova-conductor en marxa?                  $colornovaconductor $novaconductor\033[0m. Introdueix \e[00;31mncn\e[00m per canviar l'estat."
IsNovaNovncproxyOn
echo -e "   Esta nova-novncproxy en marxa?                 $colornovanovncproxy $novanovncproxy\033[0m. Introdueix \e[00;31mnnv\e[00m per canviar l'estat."
echo -e "$red Serveis Neutron$nocolor:"
IsNeutronServerOn
echo -e "   Esta neutron-server en marxa?                  $colorneutronserver $neutronserver\033[0m. Introdueix \e[00;31mnes\e[00m per canviar l'estat."
IsNeutronL3agentOn
echo -e "   Esta neutron-l3-agent en marxa?                $colorneutronl3agent $neutronl3agent\033[0m. Introdueix \e[00;31mne3\e[00m per canviar l'estat."
IsNeutronMetadataagentOn
echo -e "   Esta neutron-metadata-agent en marxa?          $colorneutronmetadataagent $neutronmetadataagent\033[0m. Introdueix \e[00;31mnem\e[00m per canviar l'estat."
IsNeutronLbaasOn
echo -e "   Esta neutron-lbaas-agent en marxa?             $colorneutronlbaas $neutronlbaas\033[0m. Introdueix \e[00;31mnel\e[00m per canviar l'estat."
IsNeutronDhcpOn
echo -e "   Esta neutron-dhcp-agent en marxa?              $colorneutrondhcp $neutrondhcp\033[0m. Introdueix \e[00;31mned\e[00m per canviar l'estat."
IsOpenvswitchOn
echo -e "   Esta openvswitch-switch en marxa?              $coloropenvswitch $openvswitch\033[0m. Introdueix \e[00;31movs\e[00m per canviar l'estat."
echo -e "$red Serveis Ceilometer$nocolor:"
IsCeilometerCentralOn
echo -e "   Esta ceilometer-agent-central en marxa?        $colorceilometercentral $ceilometercentral\033[0m. Introdueix \e[00;31mcce\e[00m per canviar l'estat."
IsCeilometerNotificationOn
echo -e "   Esta ceilometer-agent-notification en marxa?   $colorceilometernotification $ceilometernotification\033[0m. Introdueix \e[00;31mcno\e[00m per canviar l'estat."
IsCeilometerApiOn
echo -e "   Esta ceilometer-api en marxa?                  $colorceilometerapi $ceilometerapi\033[0m. Introdueix \e[00;31mcap\e[00m per canviar l'estat."
IsCeilometerCollectorOn
echo -e "   Esta ceilometer-collector en marxa?            $colorceilometercollector $ceilometercollector\033[0m. Introdueix \e[00;31mcco\e[00m per canviar l'estat."
IsCeilometerAlarmevaluatorOn
echo -e "   Esta ceilometer-alarm-evaluator en marxa?      $colorceilometeralarmevaluator $ceilometeralarmevaluator\033[0m. Introdueix \e[00;31mcae\e[00m per canviar l'estat."
IsCeilometerAlarmnotifierOn
echo -e "   Esta ceilometer-alarm-notifier en marxa?       $colorceilometeralarmnotifier $ceilometeralarmnotifier\033[0m. Introdueix \e[00;31mcan\e[00m per canviar l'estat."
echo -e "$red Serveis Cinder$nocolor:"
IsCinderApiOn
echo -e "   Esta cinder-api en marxa?                      $colorcinderapi $cinderapi\033[0m. Introdueix \e[00;31mcip\e[00m per canviar l'estat."
echo -e "$red Serveis Heat$nocolor:"
IsHeatApiOn
echo -e "   Esta heat-api en marxa?                        $colorheatapi $heatapi\033[0m. Introdueix \e[00;31mhpi\e[00m per canviar l'estat."
IsHeatApiCfnOn
echo -e "   Esta heat-api-cfn en marxa?                    $colorheatcfn $heatcfn\033[0m. Introdueix \e[00;31mhac\e[00m per canviar l'estat."
IsHeatApiCloudOn
echo -e "   Esta heat-api-cloudwatch en marxa?             $colorheatcloud $heatcloud\033[0m. Introdueix \e[00;31mhcl\e[00m per canviar l'estat."
IsHeatEngineOn
echo -e "   Esta heat-engine en marxa?                     $colorheatengine $heatengine\033[0m. Introdueix \e[00;31mhen\e[00m per canviar l'estat."
echo -e "$red Serveis Murano$nocolor:"
IsMuranoApiOn
echo -e "   Esta openstack-murano-api en marxa?            $colormuranoapi $muranoapi\033[0m. Introdueix \e[00;31mmap\e[00m per canviar l'estat."
IsMuranoEngineOn
echo -e "   Esta openstack-murano-engine en marxa?         $colormuranoengine $muranoengine\033[0m. Introdueix \e[00;31mmen\e[00m per canviar l'estat."


echo
date
ram=`free -h | grep Mem | tr G " " |tr -s " " | cut -d " " -f 4`
ramround=`free -h | grep Mem | tr G " " |tr -s " " | cut -d " " -f 4 | cut -d "." -f 1`
#echo $ram
#echo $ramround
#ramround=2
echo -e "Memoria lliure: $red$ram\033[0m GB"
#valornumeric='^[0-9]+$'
if [ $ramround -lt 3 ]
	then
		echo -e "$red La RAM es molt baixa!\033[0m"
	else
		echo -e "$green La RAM esta en bon estat.\033[0m"
fi
echo

echo -e "$red Introdueix RbT per reiniciar el servidor. COMPTE AMB AQUESTA ORDRE!!!$nocolor"
echo

echo -e -n "Per eixir de l'script introdueix \e[00;31mqqq\e[00m, o tria el nombre d'opció adequada: "
read opcio
#read -n 3 opcio
echo







## Invert status scripts:
#Apache2
if [ "$opcio" == "apa" ]
	then
		if [ "$apache" = "NO" ]
			then service apache2 restart
		else service apache2 stop
		fi
fi
#HAproxy
if [ "$opcio" == "hap" ]
	then
		if [ "$haproxy" = "NO" ]
			then service haproxy restart
		else service haproxy stop
		fi
fi
#GlanceRegistry
if [ "$opcio" == "glr" ]
        then
                if [ "$glanceregistry" = "NO" ]
                        then service glance-registry restart
                else service glance-registry stop
                fi
fi
#GlanceApi
if [ "$opcio" == "gla" ]
        then
                if [ "$glanceapi" = "NO" ]
                        then service glance-api start
                else service glance-api stop
                fi
fi
#Keystone
if [ "$opcio" == "key" ]
        then
                if [ "$keystone" = "NO" ]
                        then service keystone restart
                else service keystone stop
                fi
fi
#NovaApi
if [ "$opcio" == "nap" ]
        then
                if [ "$novaapi" = "NO" ]
                        then service nova-api restart
                else service nova-api stop
                fi
fi
#NovaCert
if [ "$opcio" == "nce" ]
        then
                if [ "$novacert" = "NO" ]
                        then service nova-cert restart
                else service nova-cert stop
                fi
fi
#NovaConsoleauth
if [ "$opcio" == "nco" ]
        then
                if [ "$novaconsoleauth" = "NO" ]
                        then service nova-consoleauth restart
                else service nova-consoleauth stop
                fi
fi
#NovaScheduler
if [ "$opcio" == "nsc" ]
        then
                if [ "$novascheduler" = "NO" ]
                        then service nova-scheduler restart
                else service nova-scheduler stop
                fi
fi
#NovaConductor
if [ "$opcio" == "ncn" ]
        then
                if [ "$novaconductor" = "NO" ]
                        then service nova-conductor restart
                else service nova-conductor stop
                fi
fi
#NovaNovncproxy
if [ "$opcio" == "nnv" ]
        then
                if [ "$novanovncproxy" = "NO" ]
                        then service nova-novncproxy start
                else service nova-novncproxy stop
                fi
fi
#NeutronServer:
if [ "$opcio" == "nes" ]
        then
                if [ "$neutronserver" = "NO" ]
                        then service neutron-server start
                else service neutron-server stop
                fi
fi

#NeutronL3agent:
if [ "$opcio" == "ne3" ]
        then
                if [ "$neutronl3agent" = "NO" ]
                        then service neutron-l3-agent start
                else service neutron-l3-agent stop
                fi
fi

#NeutronMetadata:
if [ "$opcio" == "nem" ]
        then
                if [ "$neutronmetadataagent" = "NO" ]
                        then service neutron-metadata-agent start
                else service neutron-metadata-agent stop
                fi
fi

#NeutronLbaas:
if [ "$opcio" == "nel" ]
        then
                if [ "$neutronlbaas" = "NO" ]
                        then service neutron-lbaas-agent restart
                else service neutron-lbaas-agent stop
                fi
fi

#NeutronDhcp:
if [ "$opcio" == "ned" ]
        then
                if [ "$neutrondhcp" = "NO" ]
                        then service neutron-dhcp-agent restart
                else service neutron-dhcp-agent stop
                fi
fi

#Openvswitch:
if [ "$opcio" == "ovs" ]
        then
                if [ "$openvswitch" = "NO" ]
                        then service openvswitch-switch restart
                else service openvswitch-switch stop
                fi
fi

#CeilometerAgentCentral:
if [ "$opcio" == "cce" ]
        then
                if [ "$ceilometercentral" = "NO" ]
                        then service ceilometer-agent-central restart
                else service ceilometer-agent-central stop
                fi
fi

#CeilometerAgentNotification:
if [ "$opcio" == "cno" ]
        then
                if [ "$ceilometernotification" = "NO" ]
                        then service ceilometer-agent-notification restart
                else service ceilometer-agent-notification stop
                fi
fi

#CeilometerApi:
if [ "$opcio" == "cap" ]
        then
                if [ "$ceilometerapi" = "NO" ]
                        then service ceilometer-api restart
                else service ceilometer-api stop
                fi
fi

#CeilometerCollerctor:
if [ "$opcio" == "cco" ]
        then
                if [ "$ceilometercollector" = "NO" ]
                        then service ceilometer-collector restart
                else service ceilometer-collector stop
                fi
fi

#CeilometerAlarmEvaluator:
if [ "$opcio" == "cae" ]
        then
                if [ "$ceilometeralarmevaluator" = "NO" ]
                        then service ceilometer-alarm-evaluator restart
                else service ceilometer-alarm-evaluator stop
                fi
fi

#CeilometerAlarmNotifier:
if [ "$opcio" == "can" ]
        then
                if [ "$ceilometeralarmnotifier" = "NO" ]
                        then service ceilometer-alarm-notifier restart
                else service ceilometer-alarm-notifier stop
                fi
fi

#CinderApi:
if [ "$opcio" == "cip" ]
        then
                if [ "$cinderapi" = "NO" ]
                        then service cinder-api restart
                else service cinder-api stop
                fi
fi
#HeatApi:
if [ "$opcio" == "hpi" ]
        then
                if [ "$heatapi" = "NO" ]
                        then service heat-api restart
                else service heat-api stop
                fi
fi
#HeatApiCfn:
if [ "$opcio" == "hac" ]
        then
                if [ "$heatcfn" = "NO" ]
                        then service heat-api-cfn restart
                else service heat-api-cfn stop
                fi
fi
#HeatApiCloudwatch:
if [ "$opcio" == "hcl" ]
        then
                if [ "$heatcloud" = "NO" ]
                        then service heat-api-cloudwatch restart
                else service heat-api-cloudwatch stop
                fi
fi
#HeatEngine:
if [ "$opcio" == "hen" ]
        then
                if [ "$heatengine" = "NO" ]
                        then service heat-engine restart
                else service heat-engine stop
                fi
fi
#OpenstackMuranoApi:
if [ "$opcio" == "map" ]
        then
                if [ "$muranoapi" = "NO" ]
                        then service openstack-murano-api restart
                else service openstack-murano-api stop
                fi
fi
#OpenstackMuranoEngine:
if [ "$opcio" == "men" ]
        then
                if [ "$muranoengine" = "NO" ]
                        then service openstack-murano-engine restart
                else service openstack-murano-engine stop
                fi
fi



#Reboot
if [ "$opcio" == "RbT" ]
        then
                shutdown -r now
                
fi





done
exit 0
