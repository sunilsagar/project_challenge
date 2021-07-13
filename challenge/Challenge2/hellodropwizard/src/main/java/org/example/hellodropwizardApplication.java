package org.example;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class hellodropwizardApplication extends Application<hellodropwizardConfiguration> {

    public static void main(final String[] args) throws Exception {
        new hellodropwizardApplication().run(args);
    }

    @Override
    public String getName() {

        return "hellodropwizard";
    }

    @Override
    public void initialize(final Bootstrap<hellodropwizardConfiguration> bootstrap) {
        // TODO: application initialization
    }

    @Override
    public void run(final hellodropwizardConfiguration configuration,
                    final Environment environment) {
        // TODO: implement application
    }

}
