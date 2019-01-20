fil='*.mat'; 
n_ch=19;
n_ep=2;
n_bands=5;

for count=1:2
    switch count
        case 1
            conn_type='PLI';
        case 2
            conn_type='PLV';
    end
    Dir=strcat('\Users\simon\Desktop\',conn_type,'\');
    global_conn=string(zeros(1,n_bands+1));
    for paz=1:3
        switch paz
            case 1
                paz_type='FNSZ';
            case 2
                paz_type='GNSZ';
            case 3
                paz_type='CTRL';
        end
        conn=cell2mat(struct2cell(load(strcat(Dir,conn_type,'_',paz_type,'.mat'))));
        for i=1:size(conn,1)
            gc=[string(sum(conn(i,:,:,:,:),[3 4 5])/((n_ch*n_ch-n_ch)*n_ep))];
            gc=[paz_type gc];
            global_conn=[global_conn; gc];
        end
    end
    global_conn(1,:)=[];
    save(strcat(Dir,'global',conn_type), 'global_conn')
end