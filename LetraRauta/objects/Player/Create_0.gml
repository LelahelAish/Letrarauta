
// Inicializa as variáveis de pulo
jump_time = 0;
is_jumping = false;

// Define outras variáveis de movimento
vspd = 0;  // Velocidade vertical
hspd = 0;  // Velocidade horizontal
spd = 4;   // Velocidade de movimento
grv = 0.5; // Gravidade
hp = 8;  // Vida inicial do player
max_hp = 8;
recent_hit = false;
invulnerable_time = 0;  // Tempo de invulnerabilidade começa em 0
invulnerable_max_time = 180;  // Duração da invulnerabilidade (3 segundos = 180 frames a 60 fps)
