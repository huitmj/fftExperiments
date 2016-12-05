function [res] = kernel( a,b,index, sw )
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

c = complex(dft15_index_lookup(index,1),dft15_index_lookup(index,2));

if sw == 1
    res1 = [ ...
        complex( ...
        real(c) * (real(a)+real(b)) + imag(c) * (imag(b)-imag(a)), ...
        real(c) * (imag(b)+imag(a)) + imag(c) * (real(a)-real(b)) ...
        ); 
        ];
    res2 = [ ...
        complex( ...
        real(c) * (real(a)+real(b)) + imag(c) * (imag(a)-imag(b)), ...
        real(c) * (imag(b)+imag(a)) + imag(c) * (real(b)-real(a)) ...
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
end

res = [res1 res2];
end
