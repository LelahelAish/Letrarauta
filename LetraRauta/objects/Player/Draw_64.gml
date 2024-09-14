// Tamanho da janela de GUI (é sempre a mesma, independente da câmera)
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

// Desenhar barra de vida no canto superior esquerdo
var life_percent = hp / max_hp;  // Percentual de vida
var bar_width = 200;  // Largura da barra
var bar_height = 20;  // Altura da barra

// Posição da barra na GUI (sempre no mesmo lugar)
var x_bar = 20;
var y_bar = 20;

// Desenhar fundo da barra
draw_set_color(c_black);
draw_rectangle(x_bar, y_bar, x_bar + bar_width, y_bar + bar_height, false);

// Desenhar parte preenchida da barra com base no percentual de vida
draw_set_color(c_red);
draw_rectangle(x_bar, y_bar, x_bar + bar_width * life_percent, y_bar + bar_height, false);
