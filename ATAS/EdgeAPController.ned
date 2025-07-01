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

import inet.nodes.ipv6.NodeBase6;
module EdgeAPController extends NodeBase6
{
    parameters:
        @display("i=abstract/router");
        IPForward = true;
        int fileszise @unit(mp)=10mp;
        string apptype=default("tcp");// type TCP,UDP,HTTP
        double ttl @unit(s)=default(2s);
}

