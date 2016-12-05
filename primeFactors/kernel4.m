function [res] = kernel4( samples, index, order )
% samples are 4 off complex numbers

dft15_lookup = ...
  [256 0;
   -250 53;
   234 -104;
   -207 150;
   171 -190;
   -128 222;
   79 -243;
   -27 255;
   ];

e = complex(dft15_lookup(index,1),dft15_lookup(index,2));

a = (samples(1)+samples(3));
b = (samples(2)+samples(4));
c = (samples(1)-samples(3));
d = (samples(2)-samples(4));

i = real(e) * (a + b);
j = real(e) * (a - b);
k = imag(e) * (c + d);
l = imag(e) * (c - d);

res1 = complex( real(i) - imag(k), imag(i) + real(k) ); 
res2 = complex( real(i) + imag(k), imag(i) - real(k) );
res3 = complex( real(j) - imag(l), imag(j) + real(l) ); 
res4 = complex( real(j) + imag(l), imag(j) - real(l) );
    
if order == 1
    res = [res1 res2 res3 res4];
    else 
    res = [res2 res1 res4 res3];
end

end