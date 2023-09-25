from bmtk.analyzer.compartment import plot_traces

_ = plot_traces(config_file='sim_ch01/config.json', node_ids=[0], report_name='v_report')
_ = plot_traces(config_file='sim_ch01/config.json', node_ids=[0], report_name='cai_report')