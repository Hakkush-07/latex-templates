settings.outformat = "pdf";
size(10cm);
real a = 1.0, b = 1.0;
int m = 3, n = 3;
real w = a*m, h = b*n;
pen color = RGB(80, 80, 255);

path out = (-1, -1) -- (-1, h+1) -- (w+1, h+1) -- (w+1, -1) -- cycle;
draw(out, white);

void fill_cell(int row, int column, pen color) {
    filldraw(circle((row + 0.5, column + 0.5), 0.3), color);
}

fill_cell(1, 1, color);

for (int i = 0; i < n+1; ++i) {
    draw((0, i*b) -- (w, i*b), linewidth(1.0pt));
}

for (int i = 0; i < m+1; ++i) {
    draw((i*a, 0) -- (i*a, h), linewidth(1.0pt));
}
