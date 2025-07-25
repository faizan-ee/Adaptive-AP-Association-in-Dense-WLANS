//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package ATAS;

import inet.base.NotificationBoard;
import inet.linklayer.IExternalNic;
import inet.linklayer.IWiredNic;
import inet.linklayer.IWirelessNic;
import inet.linklayer.loopback.LoopbackInterface;
import inet.mobility.contract.IMobility;
import inet.networklayer.common.InterfaceTable;
import inet.networklayer.ipv6.RoutingTable6;
import inet.util.PcapRecorder;
import inet.mobility.single.RectangleMobility;
import inet.nodes.ipv6.NetworkLayer6;
//
// BaseHost contains the common lower layers (linklayer and networklayer)
// of Router, StandardHost, WirelessHost etc.
//
// NOTE: - IPForward is turned on by default.
//       - use this model only as a base type. In simulations use Router, StandardHost,
//         WirelessHost and AndhocHost
//
module mn
{
    parameters:
        @display("bgb=623,479");
        @node;
        @labels(node,ethernet-node,wireless-node);
        int numExtInterfaces = default(0);
        int numRadios = default(0);               // the number of radios in the router. by default no wireless
        int numPcapRecorders = default(0); // no of PcapRecorders.
        string mobilityType = default("StationaryMobility");
        xml routingTable = default(xml("<routingTable/>"));
        bool IPForward = default(true);
         int x @unit("m");
        int y @unit("m");
    gates:
        input radioIn[numRadios] @directIn;
        inout pppg[] @labels(PPPFrame-conn);
        inout ethg[] @labels(EtherFrame-conn);
    submodules:
        notificationBoard: NotificationBoard {
            parameters:
                @display("p=53,155;is=s");
        }

        // optional mobility module. Required only if wireless cards are present
      //  mobility: <mobilityType> like IMobility if mobilityType != "" && numRadios > 0 
      mobility:RectangleMobility{
            parameters:
                constraintAreaMinX=x;
                constraintAreaMinY=y;
                @display("p=53,111");
        }

        // network layer
        networkLayer: NetworkLayer6 {
            parameters:
                @display("p=329,287;q=queue");
        }

        routingTable6: RoutingTable6 {
            parameters:
                @display("p=53,225;is=s");
                isRouter = IPForward;
                routingTable = routingTable;
        }

        // linklayer
        interfaceTable: InterfaceTable {
            parameters:
                @display("p=53,287;is=s");
        }

        pcapRecorder[numPcapRecorders]: PcapRecorder {
            @display("p=53,338,r,10");
        }

        lo0: LoopbackInterface {
            @display("p=78,406");
        }
        wlan[numRadios]: <default("Ieee80211Nic")> like IWirelessNic {
            parameters:
                @display("p=159,406;q=queue");
        }
        eth[sizeof(ethg)]: <default("EthernetInterface")> like IWiredNic {
            parameters:
                @display("p=282,406,row,90;q=txQueue");
        }
        ppp[sizeof(pppg)]: <default("PPPInterface")> like IWiredNic {
            parameters:
                @display("p=407,406,row,90;q=txQueue");
        }
        ext[numExtInterfaces]: <default("ExtInterface")> like IExternalNic {
            parameters:
                @display("p=547,406,row,90;q=txQueue;i=block/ifcard");
        }

    connections allowunconnected:
        // connections to network outside
        networkLayer.ifOut++ --> lo0.upperLayerIn;
        lo0.upperLayerOut --> networkLayer.ifIn++;

        for i=0..sizeof(radioIn)-1 {
            radioIn[i] --> wlan[i].radioIn;
            wlan[i].upperLayerOut --> networkLayer.ifIn++;
            wlan[i].upperLayerIn <-- networkLayer.ifOut++;
        }

        for i=0..sizeof(ethg)-1 {
            ethg[i] <--> eth[i].phys;
            eth[i].upperLayerOut --> networkLayer.ifIn++;
            eth[i].upperLayerIn <-- networkLayer.ifOut++;
        }

        for i=0..sizeof(pppg)-1 {
            pppg[i] <--> ppp[i].phys;
            ppp[i].upperLayerOut --> networkLayer.ifIn++;
            ppp[i].upperLayerIn <-- networkLayer.ifOut++;
        }

        for i=0..numExtInterfaces-1 {
            ext[i].upperLayerOut --> networkLayer.ifIn++;
            ext[i].upperLayerIn <-- networkLayer.ifOut++;
        }
}