// Copyright (C) 2007 Faqir Zarrar Yousaf
// Communication Networks Institute
// University of Dortmund, Germany
// faqir.yousaf@uni-dortmund.de
//
// Copyright (C) 2004 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//


package ATAS;

import inet.world.radio.ChannelControl;
import inet.nodes.xmipv6.WirelessHost6;
import inet.nodes.xmipv6.HomeAgent6;
import inet.nodes.xmipv6.CorrespondentNode6;
import inet.nodes.wireless.AccessPoint;
import inet.nodes.ipv6.Router6;
import inet.networklayer.autorouting.ipv6.FlatNetworkConfigurator6;
import inet.linklayer.ethernet.EtherHub;
import inet.status.Monitorplot;

network ATAS
{
    parameters:
        //   double total_mn;
        double total_cn;
        double nodeSeparation @unit("m") = default(50m);
        int speedMAG @unit("m") = default(2000m);
        @display("bgb=1000,2000,white");
    submodules:
        configurator: FlatNetworkConfigurator6 {
            parameters:
                @display("p=801,88");
        }
        channelControl: ChannelControl {
            parameters:
                numChannels = 5;
                @display("p=801,176");
        }
        Edge_Controller: EdgeAPController {
            parameters:
                @display("p=499,221;is=l");
        }
        HybridUser_5: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=455,670;i=old/comp_a");
        }
        Global_ATAS_Manager[total_cn]: ATASManager {
            @display("i=device/router;p=499,94;is=l");
        }
        Conference_Room: AccessPoint {
            parameters:
                @display("p=98,392;i=device/accesspoint_s;is=l");
        }
        Admin: AccessPoint {
            parameters:
                @display("p=621,392;i=device/accesspoint_s;is=l");
        }
        Finance: AccessPoint {
            parameters:
                @display("p=904,398;i=device/accesspoint_s;is=l");
        }
        Multicast_Switch: Router6 {
            parameters:
                @display("p=244,285;i=abstract/multicast;is=l");
        }
        Unicast_Switch: Router6 {
            parameters:
                @display("p=747,285;i=abstract/switch;is=l");
        }
        GroupUser_1: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=65,536;i=device/pocketpc");
        }
        mcUser_1: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=160,536;i=device/wifilaptop");
        }
        GroupUser_2: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=271,536;i=device/pocketpc");
        }
        mcUser_2: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=378,536;i=device/wifilaptop");
        }
        mcUser_3: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=108,628;i=device/wifilaptop");
        }
        GroupUser_3: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=218,628;i=device/pocketpc");
        }
        mcUser_4: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=323,628;i=device/wifilaptop");
        }
        GroupUser_4: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=51,713;i=device/pocketpc");
        }
        GroupUser_5: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=184,713;i=device/pocketpc");
        }
        GroupUser_6: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=308,713;i=device/pocketpc");
        }
        soloUser_1: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=516,536;i=device/printer");
        }
        HybridUser_1: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=625,536;i=device/card");
        }
        soloUser_2: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=568,621;i=old/telnet");
        }
        HybridUser_3: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=747,536;i=device/pc");
        }
        soloUser_5: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=853,536;i=device/pc2");
        }
        soloUser_3: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=682,634;i=device/lan-ring");
        }
        HybridUser_4: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=927,633;i=device/lan;is=l");
        }
        soloUser_4: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=801,634;i=abstract/accesspoint");
        }
        HybridUser_2: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=568,735;i=device/server2");
        }
        Liberary: AccessPoint {
            parameters:
                @display("p=397,392;i=device/accesspoint_s;is=l");
        }

        Traffic_Monitor: Monitorplot {
            @display("p=176,88;i=old/comp,,0;is=l");
        }
    connections allowunconnected:

                         //Home_Agent.ethOut++ --> ethernetline --> R_1.ethIn++;
                         //Home_Agent.ethIn++ <-- ethernetline <-- R_1.ethOut++;

        Admin.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> Unicast_Switch.ethg++;
        Liberary.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> Multicast_Switch.ethg++;

                                                       //R_2.ethOut++ --> ethernetline --> R_3.ethIn++;
                                                       //R_2.ethIn++ <-- ethernetline <-- R_3.ethOut++;

        Conference_Room.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> Multicast_Switch.ethg++;
        Multicast_Switch.ethg++ <--> ethernetline { @display("ls=,3"); } <--> Conference_Room.ethg++;

        // Connect Finance to Unicast_Switch
        Finance.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> Unicast_Switch.ethg++;

        // Connect Unicast_Switch to Edge_Controller
        Unicast_Switch.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> Edge_Controller.ethg++;

        for i=0..total_cn-1 {
            Edge_Controller.ethg++ <--> ethernetline { @display("ls=,3"); } <--> Global_ATAS_Manager[i].ethg++;
            Global_ATAS_Manager[i].ethg++ <--> ethernetline { @display("ls=,3"); } <--> Edge_Controller.ethg++;
        }
        Multicast_Switch.ethg++ <--> ethernetline { @display("ls=,3"); } <--> Edge_Controller.ethg++;
}
channel fiberline extends ned.DatarateChannel
{
    parameters:
        delay = 1us;
        datarate = 512Mbps;
}

channel ethernetline extends ned.DatarateChannel
{
    parameters:
        delay = 0.1us;
        datarate = 100Mbps;
}

