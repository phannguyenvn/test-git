<?php
namespace Modules\Site;

use Phalcon\DI\FactoryDefault;

class Module
{
    /**
     * Registers the module auto-loader
     */
    public function registerAutoloaders()
    {
        $loader = FactoryDefault::getDefault()->get('loader');

        $loader->registerNamespaces([
            'Site\Controllers' => ROOT_URL . '/apps/modules/site/controllers/',
            'Plugins' => ROOT_URL . '/apps/plugins/',
            'Models' => ROOT_URL . '/apps/models/'
        ],true);
    }

    /**
     * Registers the module-only services
     *
     * @param Phalcon\DI $di
     */
    public function registerServices($di)
    {
        // Registering a dispatcher
        $dispatcher = $di['dispatcher'];
        $dispatcher->setDefaultNamespace('Site\Controllers');

        /**
         * Setting up the view component
         */
        $view = $di['view'];
        $view->setViewsDir(__DIR__ . '/views/');
    }
}
