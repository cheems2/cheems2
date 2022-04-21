function [th,err,yi]=polyfits(x,y,N,xi,r)
M=length(x)
x=x(:)
y=y(:)
if nargin==4
    if length(x)==M
        r=xi
        xi=x
    else r=1
    end
elseif nargin==3
    xi=x
    r=1
end
A=(:,N+1)=ones(M,1)
for n=N:-1:1
    A=(:,n)=A(:,n+1).*x
end
if length(r)==M
    for m=1:M
        A(m,:)=A(m,:)/r(m)
        y(m)=y(m)/r(m)
    end
end
th=(A\y)'
ye=polyval(th,x)
err=norm(y-ye)/norm(y)
yi=polyval(th,xi)
