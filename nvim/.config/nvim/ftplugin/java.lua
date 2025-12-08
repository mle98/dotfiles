local config = {

  cmd = { '/home/mat/.local/share/nvim/mason/packages/jdtls/bin/jdtls',
        '--java-executable', '/usr/lib/jvm/jdk-21.0.2/bin/java',
        '--jvm-arg=-javaagent:/home/mat/.cache/adndevtools/maven/repo/org/projectlombok/lombok/1.18.36/lombok-1.18.36.jar'
  },
  root_dir = require('jdtls.setup').find_root { '/home/mat/projects/nvim2' },
  settings = {
    java = {},
  },
}

config['init_options'] = {
  bundles = {
    vim.fn.glob(vim.fn.expand '$HOME/programs/java-debug-main/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*jar', 1),
  },
}

require('jdtls').start_or_attach(config)
