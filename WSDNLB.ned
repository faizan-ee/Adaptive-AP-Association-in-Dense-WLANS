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


package sdnlb;

import inet.world.radio.ChannelControl;
import inet.nodes.xmipv6.WirelessHost6;
import inet.nodes.xmipv6.HomeAgent6;
import inet.nodes.xmipv6.CorrespondentNode6;
import inet.nodes.wireless.AccessPoint;
import inet.nodes.ipv6.Router6;
import inet.networklayer.autorouting.ipv6.FlatNetworkConfigurator6;
import inet.linklayer.ethernet.EtherHub;
import inet.status.Monitorplot;

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

network SDNLB
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
                @display("p=763,53");
        }
        channelControl: ChannelControl {
            parameters:
                numChannels = 5;
                @display("p=753,123");
        }
        GC: Globalcontoller {
            parameters:
                @display("p=417,226;i=block/network");
        }
        MN: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=317,722");
        }
        LC[total_cn]: Localcontroller {
            @display("i=block/circle");
        }
        AP_Home: AccessPoint {
            parameters:
                @display("p=208,517;i=device/accesspoint_s");
        }
        AP_1: AccessPoint {
            parameters:
                @display("p=574,517;i=device/accesspoint_s");
        }
        SWs: Router6 {
            parameters:
                @display("p=417,321;i=block/passiveq");
        }
        MN1: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=162,656");
        }
        MN2: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=226,689");
        }
        MN3: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=265,602");
        }
        MN4: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=135,569");
        }
        MN5: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=90,644");
        }
        MN6: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=201,602");
        }
        MN7: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=379,608");
        }
        MN8: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=148,735");
        }
        MN9: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=296,644");
        }
        MN10: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=515,579");
        }
        MN11: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=613,546");
        }
        MN12: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=574,689");
        }
        MN13: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=494,644");
        }
        MN14: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=684,677");
        }
        MN15: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=665,602");
        }
        MN16: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=635,755");
        }
        MN17: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=704,518");
        }
        MN18: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=521,735");
        }
        MN19: mnipv6 {
            parameters:
                //   y = (400m)+(floor(index/(3))*nodeSeparation)+(nodeSeparation);
                ///    x = ((index%floor(sqrt(total_mn)))*nodeSeparation)+(nodeSeparation);
                // @display("p=160,530");
                @display("p=717,788");
        }
        AP_2: AccessPoint {
            parameters:
                @display("p=417,507;i=device/accesspoint_s");
        }

        mcon: Monitorplot {
            @display("p=27,23;i=abstract/table");
        }
    connections allowunconnected:

                         //Home_Agent.ethOut++ --> ethernetline --> R_1.ethIn++;
                         //Home_Agent.ethIn++ <-- ethernetline <-- R_1.ethOut++;

        AP_1.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> SWs.ethg++;
        AP_2.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> SWs.ethg++;

                                                       //R_2.ethOut++ --> ethernetline --> R_3.ethIn++;
                                                       //R_2.ethIn++ <-- ethernetline <-- R_3.ethOut++;

        AP_Home.ethg++ <--> ethernetline { @display("ls=,4,s"); } <--> SWs.ethg++;
        SWs.ethg++ <--> ethernetline { @display("ls=,3"); } <--> AP_Home.ethg++;

        for i=0..total_cn-1 {
            GC.ethg++ <--> ethernetline { @display("ls=,3"); } <--> LC[i].ethg++;
            LC[i].ethg++ <--> ethernetline { @display("ls=,3"); } <--> GC.ethg++;
        }
        SWs.ethg++ <--> ethernetline { @display("ls=,3"); } <--> GC.ethg++;
}
