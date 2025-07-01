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

module ATASManager extends EdgeAPController
{
    parameters:
        int CPU=2;
        int memory @unit(GB)=2GB;
        int Hardisk @unit(GB)=250GB;
    networkLayer.xMIPv6Support = true;
    networkLayer.mipv6support.isMobileNode = false; //is Mobile Node
    networkLayer.mipv6support.isHomeAgent = true; //is Home Agent
    
        
}