%Remove spaces from csv file.
function [] = space_remover(name, directory)
    in_name = [directory '/' name];
    out_name = [directory '/no_space_' name];
    fid_in  = fopen(in_name);
    fid_out = fopen(out_name,'w');
    text_in = fgetl(fid_in);
    while ischar(text_in)
        text_out = [regexprep(text_in,' ','')];
        fprintf(fid_out,'%s\n',text_out);
        disp(text_in)
        disp(text_out)
        text_in = fgetl(fid_in);
    end
    fclose(fid_in);
    fclose(fid_out);
end