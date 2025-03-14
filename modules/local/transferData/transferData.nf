process TRANSFER_DATA {
    label 'process_single'
    conda "${moduleDir}/environment.yml"
    
    input:
    tuple val(meta), val(info)
    path "dbinfo.yaml"
    
    when:
    task.ext.when == null || task.ext.when

    script:
    def source_directory=meta.id
    def target_directory=info[0]
    def pi=info[1]
    """
    transfer_data.py ${source_directory} ${target_directory} ${pi} True "writer" ""
    """
}

