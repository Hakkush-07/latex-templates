settings.outformat = "pdf";
size(10cm);
real a = 1.0, b = 1.0;
int m = 5, n = 5;
real w = a*m, h = b*n;
path out = (-1, -1) -- (-1, h+1) -- (w+1, h+1) -- (w+1, -1) -- cycle;

// fill(out, RGB(0, 255, 255));
draw(out, white);

void fill_cell(int row, int column, pen color)
{
    fill((row*a, column*b) -- (row*a+a, column*b) -- (row*a+a, column*b+b) -- (row*a, column*b+b) -- cycle, color);
}

fill_cell(0, 2, RGB(80, 80, 255));
fill_cell(1, 0, RGB(80, 80, 255));
fill_cell(1, 1, RGB(80, 80, 255));
fill_cell(1, 3, RGB(80, 80, 255));
fill_cell(1, 4, RGB(80, 80, 255));
fill_cell(2, 2, RGB(80, 80, 255));
fill_cell(3, 0, RGB(80, 80, 255));
fill_cell(3, 1, RGB(80, 80, 255));
fill_cell(3, 3, RGB(80, 80, 255));
fill_cell(3, 4, RGB(80, 80, 255));
fill_cell(4, 2, RGB(80, 80, 255));

for (int i = 0; i < n+1; ++i)
{
	draw((0, i*b) -- (w, i*b), linewidth(1.0pt));
}
for (int i = 0; i < m+1; ++i)
{
	draw((i*a, 0) -- (i*a, h), linewidth(1.0pt));
}

