
x = read.table("C:\\Users\\jimmy\\Dropbox\\Ballesteros\\src\\Sociometry\\RemoteSystemsTempFiles\\instancia5\\eficiencias_grupales.txt")


plot(x[,1],as.numeric(as.character(x[,12])), type = "l",col=1, lty=1,lwd =3, main = "BÚSQUEDA LOCAL HÍBRIDA CON PESOS EN FUNCIÓN DEL NÚMERO DE INTEGRANTES: Eficiencia vs Iteraciones", ylim = c(0.0, 1.0), xlim= c(0.0 , dim(x)[]), xlab = "Iteraciones", ylab = "Eficiencia")


for ( i in (2:length(x)-1))
{
  print(i)
  lines(x[,1],as.numeric(as.character(x[,i])), type = "l",col = i,lty=i, lwd = 0.5)
}

legend(150000, 0.5, c("Eficiencia Global", "Eficiencia Grupal 1", "Eficiencia Grupal 2", "Eficiencia Grupal 3", "Eficiencia Grupal 4", "Eficiencia Grupal 5", 
                    "Eficiencia Grupal 6", "Eficiencia Grupal 7", "Eficiencia Grupal 8", "Eficiencia Grupal 9", "Eficiencia Grupal 10"), col = c(1:10),text.col = 4, lty = c(1:10))


#identify(as.numeric(as.character(x[,2]), "Eficiencia global")


# points(x[,1],as.numeric(as.character(x[,3])),pch = 3, col = 4, lwd = 1.5)

