process UPDATEDB {
    label 'process_single'
    conda "${moduleDir}/environment.yml"
    
    input:
    tuple val(meta), val(info)
    path "dbinfo.yaml"
    
    when:
    task.ext.when == null || task.ext.when

    script:
    def source_directory=meta.id
    def pi=info[1]
    """
    updateDB.py ${source_directory} ${pi} True "writer" ""
    """
}

