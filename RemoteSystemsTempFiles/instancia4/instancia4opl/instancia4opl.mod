/*********************************************
 * OPL 6.3 Model
 * Author: jimmy
 * Creation Date: 31/08/2014 at 15:47:46
 *********************************************/
/*********************************************
 * OPL 6.3 Model
 * Author: jimmy
 * Creation Date: 25/07/2014 at 22:30:15
 *********************************************/
 
  using CP;
 
 /*main
 {
  	var opl = thisOplModel;
  	var mod = opl.modelDefinition;
  	var dat = opl.datElements;
  	
  	cplex.clearModel();
  	opl = new IloOplModel(mod,cplex);
  	
  	opl.addDataSource(dat);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  	
  	opl.generate();
  	cplex.solve();
  
} */
 
 
 /*int m = 4; // Total de proyectos
 int n = 7; // Total de personas disponibles 
 int r = 4; // Total de especialidades disponibles 
 int k = 3; // Total de tipo de jornadas*/
 
 float U = 0.0;//

 {string} o1 = {"h1","h2","h3","h4","h5","h6","h7","h8","h9","h10","h11","h12","h13","h14","h15","h16","h17","h18","h19"};
 {string} o2 = {"h20","h21","h22","h23","h24","h25","h26","h27","h28","h29","h30","h31","h32","h33","h34","h35","h36","h37","h38","h39","h40","h41","h42"};
 {string} o3 = {"h43","h44","h45","h46","h47","h48","h49","h50","h51","h52","h53","h54","h55","h56","h57","h58","h59","h60","h61"};
 {string} o4 = {"h62","h63","h64","h65","h66","h67","h68","h69","h70","h71","h72","h73","h74","h75","h76","h77","h78","h79","h80","h81","h82","h83","h84","h85"};
 {string} o5 = {"h86","h87","h88","h89","h90","h91","h92","h93","h94","h95","h96","h97","h98","h99","h100"};
 
 
 {string} P = {"p1","p2","p3","p4","p5","p6","p7","p8","p9","p10"}; // conjunto de proyectos
 
 {string} H = {"h1","h2","h3","h4","h5","h6","h7","h8","h9","h10","h11","h12","h13","h14","h15","h16","h17","h18","h19"
 ,"h20","h21","h22","h23","h24","h25","h26","h27","h28","h29","h30","h31","h32","h33","h34","h35","h36","h37","h38","h39","h40","h41","h42"
 ,"h43","h44","h45","h46","h47","h48","h49","h50","h51","h52","h53","h54","h55","h56","h57","h58","h59","h60","h61" 
 ,"h62","h63","h64","h65","h66","h67","h68","h69","h70","h71","h72","h73","h74","h75","h76","h77","h78","h79","h80","h81","h82","h83","h84","h85"
 ,"h86","h87","h88","h89","h90","h91","h92","h93","h94","h95","h96","h97","h98","h99","h100"};//conjunto de personas
 
 
 {string} E = {"e1","e2","e3","e4","e5"}; // Conjunto de especialidades disponibles
 //{float} J = {c*0.5 | c in 0..10}; // Conjunto de jornadas disponibles
 
  float W[P] =...;
 // dexpr para utilizar var aux

int S[H][H] =...;
 
 float R[E][P] =...;

// dvar int X[1..n][1..m] in 1..3;
 //dvar float x[1..n][1..m];

dvar int x[H][P] in 0..4; 
dexpr float X[h in H][p in P] = x[h][p]/4.0; // vector que solo puede tomar los valores de las jornadas

dexpr float N[p in P] = sum(i in H,j in H)(S[i][j]*X[i][p]*X[j][p]); // numero de aceptaciones
//dvar float N2[P]; // numero de rechazos

//dexpr int Dif[p in P] = (N1[p]-N2[p]);
dexpr float EF[p in P]= N[p]/(sum(i in H, j in H)X[i][p]*X[j][p]);
//dexpr float EF[p in P] = Dif[p]/su[p];

maximize sum(p in P)W[p]*EF[p];

subject to 
{
	 denominador_EF_ditinto_de_0:
     forall(p in P)
     {
 	 	sum(i in H, j in H)X[i][p]*X[j][p] >0 ; 
     }
     
     maximo_trabajo_por_porsona:
     forall(h in H)
     {
     	sum(p in P)X[h][p]<=1; 
     }
     
     cumplimiento_de_demanda_especialidades_por_proyecto:
     forall(p in P,e in E)
     {
 	  	sum(h in o1)X[h][p]== R["e1"][p];
     }
     
     forall(p in P,e in E)
     {
 	  	sum(h in o2)X[h][p]== R["e2"][p];
     }
     
     forall(p in P,e in E)
     {
 	  	sum(h in o3)X[h][p]== R["e3"][p];
     }
     
     forall(p in P,e in E)
     {
 	  	sum(h in o4)X[h][p]== R["e4"][p];
     }
     
     forall(p in P,e in E)
     {
 	  	sum(h in o5)X[h][p]== R["e5"][p];
     }
     //Minimo_umbral_de_eficiencia_por_proyecto:
     
   /*  forall(p in P)
     {
     	EF[p]>=U;
     }*/
     
}