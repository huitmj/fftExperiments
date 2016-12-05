function [res] = kernel4( samples, index, sw )
%KERNEL Summary of this function goes here
%   Detailed explanation goes here
dft15_index_lookup = ...
  [256 0;
   -250 53;
   234 -104;
   -207 150;
   171 -190;
   -128 222;
   79 -243;
   -27 255;
   ];


a = samples(1)+samples(2);
b = samples(3)+samples(4);
e = samples(1)-samples(2);
f = samples(3)-samples(4);

c = complex(dft15_index_lookup(index,1),dft15_index_lookup(index,2));

i = (samples(1)+samples(3))+(samples(2)+samples(4));
j = (samples(1)+samples(3))-(samples(2)+samples(4));
k = (samples(1)-samples(3))+(samples(2)-samples(4));
l = (samples(1)-samples(3))-(samples(2)-samples(4));

if sw == 1
    res1 = [ ...
        complex( ...
        real(c) * (real(i)) + imag(c) * (imag(b)-imag(a)), ...
        real(c) * (imag(i)) + imag(c) * (real(a)-real(b)) ...
        ); 
        ];
    res2 = [ ...
        complex( ...
        real(c) * (real(i)) + imag(c) * (imag(a)-imag(b)), ...
        real(c) * (imag(i)) + imag(c) * (real(b)-real(a)) ...
        );
        ];
    res3 = [ ...
        complex( ...
        real(c) * (real(j)) + imag(c) * (imag(f)-imag(e)), ...
        real(c) * (imag(j)) + imag(c) * (real(e)-real(f)) ...
        ); 
        ];
    res4 = [ ...
        complex( ...
        real(c) * (real(j)) + imag(c) * (imag(e)-imag(f)), ...
        real(c) * (imag(j)) + imag(c) * (real(f)-real(e)) ...
        );
        ];
    else 
    res1 = [ ...
        complex( ...
        real(c) * (real(a)+real(b)) + imag(c) * (imag(a)-imag(b)), ...
        real(c) * (imag(b)+imag(a)) + imag(c) * (real(b)-real(a)) ...
        );
        ];
    res2 = [ ...
        complex( ...
        real(c) * (real(a)+real(b)) + imag(c) * (imag(b)-imag(a)), ...
        real(c) * (imag(b)+imag(a)) + imag(c) * (real(a)-real(b)) ...
        );
        ];
    res3 = [ ...
        complex( ...
        real(c) * (real(e)+real(f)) + imag(c) * (imag(e)-imag(f)), ...
        real(c) * (imag(f)+imag(e)) + imag(c) * (real(f)-real(e)) ...
        );
        ];
    res4 = [ ...
        complex( ...
        real(c) * (real(e)+real(f)) + imag(c) * (imag(f)-imag(e)), ...
        real(c) * (imag(f)+imag(e)) + imag(c) * (real(e)-real(f)) ...
        );
        ];
end

res = [res1 res2 res3 res4];
end

