------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                    A U N I T . M E M O R Y . U T I L S                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                                                                          --
--                     Copyright (C) 2008-2012, AdaCore                     --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT is maintained by AdaCore (http://www.adacore.com)                   --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;

package body AUnit.Memory.Utils is

   ---------------
   -- Gen_Alloc --
   ---------------

   function Gen_Alloc return Name is
      function To_Name is new Ada.Unchecked_Conversion (System.Address, Name);
      Ret : constant System.Address := AUnit_Alloc (Object'Object_Size / 8);
      --  Declare an actual object at Ret Address so that the default
      --  initialisation is performed.
      Obj : Object;
      for Obj'Address use Ret;
      pragma Warnings (Off, Obj);
   begin
      return To_Name (Ret);
   end Gen_Alloc;

end AUnit.Memory.Utils;
