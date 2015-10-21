with Ada.Text_IO,Ada.Integer_Text_IO;
use Ada.Text_IO,Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
procedure Main is

subtype rango is Integer range 65..80;
package randomRitmoC is new Ada.Numerics.Discrete_Random (rango);
   use randomRitmoC;
subtype rango1 is Integer range 75..92;
package randomPArtA is new Ada.Numerics.Discrete_Random (rango1);
   use randomPArtA;
subtype rango2 is Integer range 115..145;
package randomPAstS is new Ada.Numerics.Discrete_Random (rango2);
   use randomPAstS;
subtype rango3 is Integer range 31..42;
package randomTemperatura is new Ada.Numerics.Discrete_Random (rango3);
   use randomTemperatura;
subtype rango4 is Integer range 10..23;
package randomResp is new Ada.Numerics.Discrete_Random (rango4);
   use randomResp;
RC,PAA,PAS,FR,T :Integer;

   task Agente;
   task type Monitoreo is
      entry signos(Rc,Paa,Pas,Fr,T:Integer);
   end Monitoreo;


   tareas : array(1..100) of Monitoreo;

   task body Agente is
      c: randomRitmoC.Generator;
      a: randomPArtA.Generator;
      s: randomPAstS.Generator;
      r: randomResp.Generator;
      te: randomTemperatura.Generator;
   begin
      for i in 1..100 loop

         Reset (c);
         Reset (a);
         Reset (s);
         Reset (r);
         Reset (te);

      RC:=Random(c);
      PAA:=Random(a);
      PAS:=Random(s);
      FR:=Random(r);
      T:=Random(te);

         tareas(i).signos(RC,PAA,PAS,FR,T);

      end loop;
   end Agente;

   task body Monitoreo is
   begin
      accept signos (Rc : in Integer; Paa : in Integer; Pas : in Integer; Fr : in Integer; T : in Integer) do

         if(Rc>=70 and Rc<=75) then
            Put("Ritmo Cardeaco Normal");
            Put(Rc);
            Put_Line("");
         else
            Put("Se Lo esta Cargando La Huesuda a todo Ritmo");
            Put(Rc);
            Put_Line("");
         end if;
         if(Paa>=80 and Paa<=89) then
            Put("Presion Arterial Asistolica Normal");
            Put(Paa);
            Put_Line("");
         else
            Put("Se Lo esta Cargando La Huesuda por presion asistolica ");
            Put(Paa);
            Put_Line("");
         end if;
         if(Pas>=120 and Pas<=140) then
            Put("Presion Arterial Sistolica Normal");
            Put(pas);
            Put_Line("");
         else
            Put("Se Lo esta Cargando La Huesuda por presion sistolica");
            Put(Pas);
            Put_Line("");
         end if;
         if(T>=36 and T<=38) then
            Put("Temperatura Normal");
            Put(T);
            Put_Line("");
         else
            Put("Se Lo esta Cargando La Huesuda con Temperatura ");
            Put(T);
            Put_Line("");
         end if;
         if(Fr>=12 and Fr<=20) then
            Put("Ritmo Respiratorio Normal");
            Put(Fr);
            Put_Line("");
         else
            Put("Se Lo esta Cargando La Huesuda a todo Ritmo respiratorio");
            Put(Fr);
            Put_Line("");
         end if;
         Put_Line("");
      end signos;

   end Monitoreo;


begin
   Put("Monitor");
end Main;
