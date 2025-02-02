


//DEFINIR OS 'INPUTS'
right = keyboard_check(ord("D"));	//RETORNA '1' CASO TECLA SEGURADA, CASO NÃO, RETORNA '0'
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);

//ALTERAR O 'hspd', VULGO VELOCIDADE HORIZONTAL
hspd = (right - left) * spd;

//VERIFICAR SE JOGADOR ESTÁ NO CHÃO
isOnFloor = place_meeting(x,y+1,objColisor);
if(!isOnFloor){
	vspd += GRAVITY * density;
}

//VERIFICAR A COLISÃO DO PLAYER HORIZONTAL
if(place_meeting(x+hspd,y,objColisor)){
	//SE NO MEU PRÓXIMO, EXISTIR UM 'objColisor', ENTÃO EU DEVO PARAR
	while(!place_meeting(x+sign(hspd),y,objColisor)){
		//CASO O PLAYER ESTEJA A MAIS DE 1 PIXEL DE DISTÂNCIA DO COLISOR, ENTÃO EU DEVO APROXIMÁ-LO
		x += sign(hspd);
	}
	
	hspd = 0;
}

x += hspd;

//VERIFICAR A COLISÃO DO PLAYER VERTICAL
if(place_meeting(x,y+vspd,objColisor)){
	//SE NO MEU PRÓXIMO, EXISTIR UM 'objColisor', ENTÃO EU DEVO PARAR
	while(!place_meeting(x,y+sign(vspd),objColisor)){
		//CASO O PLAYER ESTEJA A MAIS DE 1 PIXEL DE DISTÂNCIA DO COLISOR, ENTÃO EU DEVO APROXIMÁ-LO
		y += sign(vspd);
	}
	
	vspd = 0;
}

y += vspd;

if(isOnFloor){
	if(jump){
		vspd = -jumpSpd
	}
}