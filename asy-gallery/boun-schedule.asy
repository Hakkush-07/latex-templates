settings.outformat = "pdf";
size(30cm);
real a = 4.0, b = 1.0;
int m = 5, n = 9;
real w = a*(m+1), h = b*(n+1);
path out = (-1, -1) -- (-1, h+1) -- (w+1, h+1) -- (w+1, -1) -- cycle;
Label[] hours = {"09.00 - 10.00", "10.00 - 11.00", "11.00 - 12.00", "12.00 - 13.00", "13.00 - 14.00", "14.00 - 15.00", "15.00 - 16.00", "16.00 - 17.00", "17.00 - 19.00"};
Label[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
pen color_a = RGB(142, 171, 249), color_b = RGB(68, 255, 58), color_c = RGB(103, 222, 155), color_d = RGB(255, 237, 124), color_e = RGB(243, 165, 88), color_f = RGB(200, 200, 200);

fill(out, RGB(0, 255, 255));

void coloring(int row, int column, Label entry, pen color)
{
	fill((row*a, (n-column)*b) -- (row*a+a, (n-column)*b) -- (row*a+a, (n-column)*b+b) -- (row*a, (n-column)*b+b) -- cycle, color);
	label(entry, (row*a+a/2, (n-column)*b+b/2), p = fontsize(20pt));
}

void coloring2(int row, int column, Label entry, Label classroom, pen color)
{
	fill((row*a, (n-column)*b) -- (row*a+a, (n-column)*b) -- (row*a+a, (n-column)*b+b) -- (row*a, (n-column)*b+b) -- cycle, color);
	label(entry, (row*a+a/2, (n-column)*b+b*0.6), p = fontsize(16pt));
	label(classroom, (row*a+a/2, (n-column)*b+b*0.2), p = fontsize(10pt));
}

void conflict(int row, int column, Label entry1, Label entry2, pen color1, pen color2)
{
	fill((row*a, (n-column)*b) -- (row*a+a, (n-column)*b) -- (row*a+a, (n-column)*b+b/2) -- (row*a, (n-column)*b+b/2) -- cycle, color1);
	label(entry1, (row*a+a/2, (n-column)*b+b/4), p = fontsize(14pt));
	fill((row*a, (n-column)*b+b/2) -- (row*a+a, (n-column)*b+b/2) -- (row*a+a, (n-column)*b+b) -- (row*a, (n-column)*b+b) -- cycle, color2);
	label(entry2, (row*a+a/2, (n-column)*b+3*b/4), p = fontsize(14pt));
}

draw(out, white);

for (int i = 1; i < n+1; ++i)
{
	coloring(0, i, hours[i-1], RGB(150, 150, 150));
}
for (int i = 1; i < m+1; ++i)
{
	coloring(i, 0, days[i-1], RGB(80, 80, 255));
}

coloring2(2, 5, "Ders3", "Sınıf", color_a);
conflict(3, 3, "Ders1", "Ders2", color_b, color_e);

for (int i = 0; i < n+2; ++i)
{
	draw((0, i*b) -- (w, i*b), linewidth(1.0pt));
}
for (int i = 0; i < m+2; ++i)
{
	draw((i*a, 0) -- (i*a, h), linewidth(1.0pt));
}
