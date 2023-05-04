with Ada.Text_IO; use Ada.Text_IO;

-- define the class
package MyClass is
   type MyClass is private;
   procedure Print_Message (Obj : in MyClass);
private
   type MyClass is record
      Message : String (1..100);
   end record;
end MyClass;

-- implementation of the class
package body MyClass is
   procedure Print_Message (Obj : in MyClass) is
   begin
      Put_Line (Obj.Message);
   end Print_Message;
end MyClass;

-- main program
procedure Main is
   Obj : MyClass.MyClass;
begin
   Obj.Message := "Hello, world!";
   Obj.Print_Message;
end Main;
