%Navire_stokes
%u
%v
%w
%du/dx
%du/dy
%du/dz
%d2u/dx2
%mu
clc
clear
N=5;
M=5;
mu=1.2*0.00001;
delta_t=0.001;
dx=0.01;
dy=0.01;
dz=0.01;
n=0;
nn=0;
for t=1:10;
    n=n+1;
    if (t==1)
        t=n;
for i=1:N;
    for j=1:M;
        u(i,j,t)=randn(1,1);
        v(i,j,t)=randn(1,1);
        w(i,j,t)=randn(1,1);
        dudx(i,j,t)=randn(1,1);
        dudy(i,j,t)=randn(1,1);
        dudz(i,j,t)=randn(1,1);
        d2udx2(i,j,t)=randn(1,1);
        dvdx(i,j,t)=randn(1,1);
        dvdy(i,j,t)=randn(1,1);
        dvdz(i,j,t)=randn(1,1);
        d2vdx2(i,j,t)=randn(1,1);
        dpdx(i,j,t)=1.3/dx;
        dpdy(i,j,t)=3.2/dy;
    end
end

for i=1:N;
    for j=1:M;
        RHS1(i,j,t)=-u(i,j,t)*dudx(i,j,t)-v(i,j,t)*dudy(i,j,t)-w(i,j,t)*dudz(i,j,t)+mu*d2udx2(i,j,t)-dpdx(i,j,t);
        RHS2(i,j,t)=-u(i,j,t)*dvdx(i,j,t)-v(i,j,t)*dvdy(i,j,t)-w(i,j,t)*dvdz(i,j,t)+mu*d2vdx2(i,j,t)-dpdy(i,j,t);
        RHS3(i,j,t)=randn(1,1);
    end
end

for i=1:N;
    for j=1:M;
    u(i,j,t+1)=u(i,j,t)+delta_t*RHS1(i,j,t);
    v(i,j,t+1)=v(i,j,t)+delta_t*RHS2(i,j,t);
    w(i,j,t+1)=w(i,j,t)+delta_t*RHS3(i,j,t);
    total=[ u(i,j,t+1) v(i,j,t+1) w(i,j,t+1)];
    v(i,j,t)=norm(total);
    end
end

elseif (t>1)
nn=nn+1;
t=nn;
for i=1:N;
    for j=1:M;
        dudx(i,j,t)=u(i,j,t)/dx;
        dudy(i,j,t)=u(i,j,t)/dy;
        dudz(i,j,t)=u(i,j,t)/dz;
        d2udx2(i,j,t)=u(i,j,t)/(dx*dx);
        dvdx(i,j,t)=v(i,j,t)/dx;
        dvdy(i,j,t)=v(i,j,t)/dy;
        dvdz(i,j,t)=v(i,j,t)/dz;
        d2vdx2(i,j,t)=v(i,j,t)/(dx*dx);
        dpdx(i,j,t)=1.3/dx;
        dpdy(i,j,t)=3.2/dy;
        RHS1(i,j,t)=-u(i,j,t)*dudx(i,j,t)-v(i,j,t)*dudy(i,j,t)-w(i,j,t)*dudz(i,j,t)+mu*d2udx2(i,j,t)-dpdx(i,j,t);
        RHS2(i,j,t)=-u(i,j,t)*dvdx(i,j,t)-v(i,j,t)*dvdy(i,j,t)-w(i,j,t)*dvdz(i,j,t)+mu*d2vdx2(i,j,t)-dpdy(i,j,t);
        RHS3(i,j,t)=randn(1,1);
    end
end
for i=1:N;
    for j=1:M;
    u(i,j,t+1)=u(i,j,t)+delta_t*RHS1(i,j,t);
    v(i,j,t+1)=v(i,j,t)+delta_t*RHS2(i,j,t);
    w(i,j,t+1)=w(i,j,t)+delta_t*RHS3(i,j,t);
    total=[ u(i,j,t+1) v(i,j,t+1) w(i,j,t+1)];
    v(i,j,t)=norm(total);
    end
end
    end
end